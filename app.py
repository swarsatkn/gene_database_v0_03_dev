from flask import Flask, render_template, request, redirect, url_for, flash
import sqlite3
import os
from datetime import datetime

# Initialize Flask app
app = Flask(__name__)

app.config['SECRET_KEY'] = "secret101"

# SQLite database path
DB_PATH = os.path.join(os.path.dirname(__file__), 'genedatabase.db')

def get_db_connection():
    """Get a database connection with row factory for dict-like access"""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

# About route
@app.route('/about', methods=['GET', 'POST'])
def about():
    if request.method == 'GET':
        return render_template('about.html')


import pandas as pd

# Load Health Map excel data logic
IRON_DATA = os.path.join(os.path.dirname(__file__), 'iron-rich-foods_state-wise.xlsx')
B12_DATA = os.path.join(os.path.dirname(__file__), 'vit-b12-rich-food_state-wise.xlsx')

def get_health_map_data():
    try:
        df_iron = pd.read_excel(IRON_DATA)
        df_b12 = pd.read_excel(B12_DATA)
        
        # Prepare a dictionary: { "state_name": {"iron": [...], "b12": [...]} }
        state_data = {}
        
        # Parse Iron data
        for _, row in df_iron.iterrows():
            state = str(row.get('State', '')).strip().lower()
            if state not in state_data:
                state_data[state] = {'iron': [], 'b12': []}
            
            food = str(row.get('Food Item', '')).strip()
            content = str(row.get('Iron Content (mg/100g)', '')).strip()
            if food:
                state_data[state]['iron'].append({'food': food, 'content': content})
                
        # Parse B12 data
        for _, row in df_b12.iterrows():
            state = str(row.get('State', '')).strip().lower()
            if state not in state_data:
                state_data[state] = {'iron': [], 'b12': []}
                
            food = str(row.get('Food Item', '')).strip()
            content = str(row.get('Vitamin B12 (µg/100g)', '')).strip()
            if food:
                state_data[state]['b12'].append({'food': food, 'content': content})

        return state_data
    except Exception as e:
        print("Error loading health map excel data:", e)
        return {}

# Nutrition Map route
@app.route('/nutrition-map', methods=['GET'])
def nutrition_map():
    state_nutrition_data = get_health_map_data()
    return render_template('nutrition_map.html', state_nutrition_data=state_nutrition_data)

# Homepage route
@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        search_query = request.form['gene_search']
        uid = datetime.now()
        return redirect(f'/gene/{search_query}/{uid}')
    
    return render_template('index.html')

# Route for gene information display
@app.route('/gene/<gene_name>/<uid>', methods=['GET', 'POST'])
def gene_info(gene_name, uid):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch the gene information
    cursor.execute("SELECT * FROM gene_info WHERE Gene = ?", (gene_name,))
    row = cursor.fetchone()
    
    # Convert Row object to dictionary for template compatibility
    gene_data = dict(row) if row else None
    
    if request.method == 'POST':
        user_notes = request.form['user_notes']
        user_name = request.form['user_name']
        user_email = request.form['user_email']
        user_profession = request.form['user_profession']
        user_organisation = request.form['user_organisation']
        
        cursor.execute(
            "INSERT INTO user_info (Gene, User_Notes, user_name, user_email, user_profession, user_organisation) VALUES (?, ?, ?, ?, ?, ?)",
            (gene_name, user_notes, user_name, user_email, user_profession, user_organisation)
        )
        conn.commit()
        cursor.close()
        conn.close()
        flash('Thank you! Your information has been recorded.', 'error')
        return redirect(f'/gene/{gene_name}/{uid}')

    cursor.close()
    conn.close()
    return render_template('gene_info.html', gene=gene_data)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
from flask import Flask, render_template, request, redirect, url_for, flash
import mysql.connector
from datetime import datetime

# Initialize Flask app
app = Flask(__name__)

app.config['SECRET_KEY'] = "secret101"

#Add/modify MySQL database configuration
db_config = {'host':'localhost',
             'user':'root',
             'password':'admin123',
             'database':'genedatabase'}

# About route
@app.route('/about', methods=['GET', 'POST'])
def about():
    if request.method == 'GET':

        return render_template('about.html')


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
    db_connection = mysql.connector.connect(**db_config)
    cursor = db_connection.cursor(dictionary=True)
    # Fetch the gene information
    cursor.execute("SELECT * FROM gene_info WHERE Gene = %s", (gene_name,))
    gene_data = cursor.fetchone()
    cursor.close()

    if request.method == 'POST':
        user_notes = request.form['user_notes']
        user_name = request.form['user_name']
        user_email = request.form['user_email']
        user_profession = request.form['user_profession']
        user_organisation = request.form['user_organisation']
        cursor = db_connection.cursor()
        cursor.execute("INSERT INTO user_info (Gene, User_Notes, user_name, user_email, user_profession, user_organisation) VALUES (%s, %s, %s, %s, %s, %s)", (gene_name, user_notes, user_name, user_email, user_profession, user_organisation))
        db_connection.commit()
        cursor.close()
        flash('Thank you! Your information has been recorded.', 'error')
        return redirect(f'/gene/{gene_name}/{uid}')

    return render_template('gene_info.html', gene=gene_data)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
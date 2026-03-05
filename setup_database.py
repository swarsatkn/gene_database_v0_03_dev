import sqlite3
import csv
import os

# Database file path
DB_PATH = os.path.join(os.path.dirname(__file__), 'genedatabase.db')

# New CSV file path
CSV_PATH = os.path.join(os.path.dirname(__file__), 'AML Mutation Knowledge Base.xlsx - Sheet1.csv')

def setup_database():
    """Create SQLite database and import data from CSV"""
    
    # Remove existing database if it exists
    if os.path.exists(DB_PATH):
        os.remove(DB_PATH)
        print(f"Removed existing database: {DB_PATH}")
    
    # Connect to SQLite database (creates the file)
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    # Create gene_info table with all columns from new CSV
    cursor.execute('''
        CREATE TABLE gene_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            Gene TEXT,
            Function TEXT,
            Disease TEXT,
            Types_of_alterations TEXT,
            Targeted_therapy TEXT,
            MRD_Marker_status TEXT,
            CHIP_status TEXT,
            ELN_2022_RISK TEXT,
            MRD_technique TEXT,
            Sensitivity TEXT,
            Monitoring_frequency TEXT,
            Sample TEXT,
            ELN_comment TEXT,
            CHIP TEXT
        )
    ''')
    print("Created gene_info table with new columns")
    
    # Create user_info table
    cursor.execute('''
        CREATE TABLE user_info (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            Gene TEXT,
            User_Notes TEXT,
            Date_Submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            user_name TEXT,
            user_email TEXT,
            user_profession TEXT,
            user_organisation TEXT
        )
    ''')
    print("Created user_info table")
    
    # Import data from CSV
    with open(CSV_PATH, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)
    
    # Insert gene data
    for row in rows:
        # Replace / with | in gene names for consistency
        gene = row['Gene'].replace('/', '|')
        cursor.execute('''
            INSERT INTO gene_info (
                Gene, Function, Disease, Types_of_alterations, 
                Targeted_therapy, MRD_Marker_status, CHIP_status, ELN_2022_RISK,
                MRD_technique, Sensitivity, Monitoring_frequency, Sample, ELN_comment, CHIP
            )
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', (
            gene,
            row.get('Function', ''),
            row.get('Disease', ''),
            row.get('Types of alterations', ''),
            row.get('Targeted therapy', ''),
            row.get('MRD Marker status', ''),
            row.get('CHIP status', ''),
            row.get('ELN 2022 RISK', ''),
            row.get('MRD technique', ''),
            row.get('Sensitivity', ''),
            row.get('Monitoring frequency', ''),
            row.get('Sample', ''),
            row.get('ELN comment', ''),
            row.get('CHIP', '')
        ))
    
    conn.commit()
    print(f"Imported {len(rows)} genes from CSV")
    
    # Verify the data
    cursor.execute("SELECT COUNT(*) FROM gene_info")
    count = cursor.fetchone()[0]
    print(f"Total genes in database: {count}")
    
    # Show sample data with new columns
    cursor.execute("SELECT Gene, Function, MRD_technique, Sensitivity, Sample FROM gene_info LIMIT 3")
    print("\nSample data (showing new columns):")
    for row in cursor.fetchall():
        mrd = row[2] if row[2] else 'N/A'
        sens = row[3] if row[3] else 'N/A'
        sample = row[4] if row[4] else 'N/A'
        print(f"  {row[0]}: MRD={mrd[:30]}, Sensitivity={sens[:15]}, Sample={sample[:15]}")
    
    conn.close()
    print(f"\nDatabase created successfully: {DB_PATH}")

if __name__ == '__main__':
    setup_database()

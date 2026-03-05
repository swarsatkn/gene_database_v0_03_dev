import csv

# Read CSV
with open('AML mutation knowledgebase.xlsx - Sheet1.csv', newline='', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    rows = list(reader)

# Generate INSERT values
values = []
for i, row in enumerate(rows, 1):
    gene = row['Gene'].replace("'", "''").replace('/', '|')
    func = row['Function'].replace("'", "''") if row['Function'] else ''
    disease = row['Disease'].replace("'", "''") if row['Disease'] else ''
    alterations = row['Types_of_alterations'].replace("'", "''") if row['Types_of_alterations'] else ''
    therapy = row['Targeted_therapy'].replace("'", "''") if row['Targeted_therapy'] else ''
    mrd = row['MRD_Marker_status'].replace("'", "''") if row['MRD_Marker_status'] else ''
    chip = row['CHIP_status'].replace("'", "''") if row['CHIP_status'] else ''
    eln = row['ELN_2022_RISK'].replace("'", "''") if row['ELN_2022_RISK'] else ''
    
    val = f"({i},'{gene}','{func}','{disease}','{alterations}','{therapy}','{mrd}','{chip}','{eln}')"
    values.append(val)

# Write to file
with open('new_inserts.sql', 'w', encoding='utf-8') as f:
    f.write(','.join(values))

print(f'Generated {len(values)} insert values')

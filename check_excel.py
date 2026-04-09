import openpyxl
wb = openpyxl.load_workbook("C:\\Users\\Brian.Ruiz\\OneDrive - Universidad Tecnológica de Pereira\\1. UTP\\2. Introducción a la Ciencia de Datos\\2026-03-Trabajo Fina\\DATA\\Evaluaciones_Agropecuarias_Municipales_–_EVA._2019_-_2024._Base_Agrícola_20260327.xlsx", read_only=True)
ws = wb.active
headers = [cell.value for cell in next(ws.iter_rows(min_row=1, max_row=1))]
print("Columns:", len(headers))
print("Headers:", headers)
print("Total rows:", sum(1 for _ in ws) + 1)
wb.close()

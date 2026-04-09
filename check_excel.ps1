$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$wb = $excel.Workbooks.Open("C:\Users\Brian.Ruiz\OneDrive - Universidad Tecnológica de Pereira\1. UTP\2. Introducción a la Ciencia de Datos\2026-03-Trabajo Fina\DATA\Evaluaciones_Agropecuarias_Municipales_–_EVA._2019_-_2024._Base_Agrícola_20260327.xlsx")
$ws = $wb.Worksheets.Item(1)
$used = $ws.UsedRange
Write-Host "Columns:" $used.Columns.Count
Write-Host "Rows:" $used.Rows.Count
$headers = @()
for($i=1; $i -le $used.Columns.Count; $i++) {
    $headers += $ws.Cells.Item(1,$i).Text
}
Write-Host ($headers -join ", ")
$excel.Quit()

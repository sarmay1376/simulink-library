import sys
import os
from xhtml2pdf import pisa
import subprocess

def convert_md_to_pdf(md_filename, pdf_filename):
    # 1. Convert MD to HTML using pandoc
    html_filename = md_filename.replace(".md", ".html")
    print(f"Converting {md_filename} to {html_filename}...")
    subprocess.run(["pandoc", md_filename, "-s", "-o", html_filename], check=True)
    
    # 2. Add some high-standard CSS for the 'book' look
    css = """
    <style>
        body { font-family: 'Helvetica', 'Arial', sans-serif; line-height: 1.6; color: #333; padding: 50px; }
        h1 { color: #2c3e50; border-bottom: 2px solid #2c3e50; padding-bottom: 10px; margin-top: 50px; }
        h2 { color: #34495e; border-bottom: 1px solid #bdc3c7; padding-bottom: 5px; margin-top: 30px; }
        pre { background-color: #f4f4f4; border: 1px solid #ddd; padding: 15px; border-radius: 5px; font-size: 10pt; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #2c3e50; color: white; }
        .page-break { page-break-after: always; }
    </style>
    """
    
    with open(html_filename, "r") as f:
        html_content = f.read()
    
    # Inject CSS
    html_content = html_content.replace("<head>", f"<head>{css}")
    
    # 3. Convert HTML to PDF
    print(f"Creating PDF: {pdf_filename}...")
    with open(pdf_filename, "w+b") as result_file:
        pisa_status = pisa.CreatePDF(html_content, dest=result_file)
        
    if pisa_status.err:
        print("Error generating PDF")
    else:
        print(f"Success! {pdf_filename} generated.")
    
    # Cleanup html
    if os.path.exists(html_filename):
        os.remove(html_filename)

if __name__ == "__main__":
    convert_md_to_pdf("SES_Manual_Source.md", "The_Big_Book_of_SES.pdf")

import os
import re

base_path = "/home/kali/Desktop/proj/MATLAB/SES-Simulink-Library/library/+ses/+block/"

for root, dirs, files in os.walk(base_path):
    for file in files:
        if file.endswith(".m"):
            file_path = os.path.join(root, file)
            with open(file_path, 'r') as f:
                content = f.read()
            
            # Check if it has 'function out =' but 'add_block' is not assigned
            if 'function out =' in content and 'add_block' in content and 'out = add_block' not in content:
                print(f"Repairing {file_path}")
                # Replace add_block(...) with out = add_block(...)
                new_content = re.sub(r'(add_block\s*\(.*?\))', r'out = \1', content)
                with open(file_path, 'w') as f:
                    f.write(new_content)

print("Repair complete.")

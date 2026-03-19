import os
from PIL import Image

image_dir = r"c:\Reps\gene_database_v0_03_dev\static\state_food_images"
output_dir = r"c:\Reps\gene_database_v0_03_dev\static\state_food_images"

# Target size
MAX_SIZE = 300

def optimize():
    for filename in os.listdir(image_dir):
        if not filename.endswith(('.png', '.jpg', '.jpeg', '.webp', '.avif')):
            continue
            
        filepath = os.path.join(image_dir, filename)
        try:
            with Image.open(filepath) as img:
                # Calculate aspect ratio
                ratio = min(MAX_SIZE / img.width, MAX_SIZE / img.height)
                if ratio < 1:
                    new_size = (int(img.width * ratio), int(img.height * ratio))
                    img = img.resize(new_size, Image.Resampling.LANCZOS)
                
                # Create base name (everything before _food.)
                if "_food" in filename:
                    base_name = filename.split("_food")[0]
                    new_filename = f"{base_name}_food.webp"
                else:
                    new_filename = os.path.splitext(filename)[0] + ".webp"
                
                new_path = os.path.join(output_dir, new_filename)
                
                # Save as webp
                img.save(new_path, "WEBP", quality=75)
                print(f"Optimized {filename} -> {new_filename}")
                
                # If we created a NEW file with different extension, remove the old one
                if new_path != filepath:
                    os.remove(filepath)
                    print(f"Removed old {filename}")
                    
        except Exception as e:
            print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
    optimize()

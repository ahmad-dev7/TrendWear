import React, { useState } from "react";

interface ImagePreview {
  id: string;
  url: string;
}

const AddImage: React.FC = () => {
  const [images, setImages] = useState<ImagePreview[]>([]);

  const handleImageChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = e.target.files;
    if (!files) return;

    const newImages: ImagePreview[] = Array.from(files).map((file) => ({
      id: URL.createObjectURL(file), // Temporary unique identifier
      url: URL.createObjectURL(file),
    }));

    setImages((prevImages) => [...prevImages, ...newImages]);
  };

  const handleRemoveImage = (id: string) => {
    setImages((prevImages) => prevImages.filter((image) => image.id !== id));
  };

  return (
    <div className="picture-container-parent" style={styles.parent}>
      {images.map((image) => (
        <div key={image.id} style={styles.previewContainer}>
          <img src={image.url} alt="preview" style={styles.imagePreview} />
          <button
            onClick={() => handleRemoveImage(image.id)}
            style={styles.removeButton}
          >
            ✕
          </button>
        </div>
      ))}
      <div style={styles.inputContainer}>
        <label style={styles.inputLabel}>
          Select Image
          <input
            type="file"
            accept="image/*"
            multiple
            onChange={handleImageChange}
            style={styles.input}
          />
        </label>
      </div>
    </div>
  );
};

const styles = {
  parent: {
    display: "flex",
    flexWrap: "wrap",
    gap: "10px", // Gap between the items
    alignItems: "center",
    justifyContent: "flex-start", // Align items to the start of the row
  },
  inputContainer: {
    width: "100%",
    height: "40px",
    backgroundColor: "#F9FAFB",
    border: "2px dashed #ccc",
    borderRadius: "5px",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    cursor: "pointer",
    position: "relative",
  },
  inputLabel: {
    width: "100%",
    height: "100%",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    color: "#666",
    fontWeight: "bold",
  },
  input: {
    position: "absolute",
    opacity: 0,
    width: "100%",
    height: "100%",
    cursor: "pointer",
  },
  previewContainer: {
    position: "relative",
    width: "90px",
    height: "50px",
  },
  imagePreview: {
    width: "100%",
    height: "100%",
    objectFit: "cover",
    borderRadius: "5px",
    border: "1px solid #ccc",
  },
  removeButton: {
    position: "absolute",
    top: "-5px",
    right: "-5px",
    background: "#f00",
    color: "#fff",
    border: "none",
    borderRadius: "50%",
    width: "20px",
    height: "20px",
    cursor: "pointer",
    fontSize: "12px",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
  },
} as const;

export default AddImage;

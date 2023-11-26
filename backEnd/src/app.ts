const { v4: uuidv4 } = require('uuid');
import multer from "multer";
import path from "path";

import express from "express";
import cors from "cors";
import * as dotenv from "dotenv";
import AppRoutes from "./routes/AppRoutes";
import dbConnection from "./db";

dotenv.config();

if (!process.env.API_ENDPOINT) {
  process.exit(1);
}

const app = express();
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'public/images');
  },
  filename: (req, file, cb) => {
    const uniqueName = uuidv4() + path.extname(file.originalname);
    cb(null, uniqueName);
  },
});

const upload = multer({ storage });
app.post('/api/Image/Upload', upload.single('file'), (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: 'Please upload a file' });
    }

    // Nếu muốn trả về đường dẫn đầy đủ tới ảnh sau khi tải lên
    const imageUrl = `${req.protocol}://${req.get('host')}/images/${req.file.filename}`;
    return res.status(200).json({ imageUrl });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});

app.use((req, res, next) => {
  req.app.set("dbConnection", dbConnection);
  next();
});

app.use(cors({
  credentials: true,
}));

app.use(express.json());
app.use(AppRoutes);
app.use(express.static('public'));

app.listen(process.env.API_ENDPOINT, () => {
  console.log(`Server port ${process.env.API_ENDPOINT} up and running...`);
});

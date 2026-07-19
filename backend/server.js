const express = require('express');
const app = express();
const PORT = 5000;

app.get('/api', (req, res) => {
    res.json({ message: "Hello from the StartTech Backend API!" });
});

app.listen(PORT, () => {
    console.log(`Backend server running on port ${PORT}`);
});

# Flask Application Deployment Script

This project provides a Bash automation script to deploy a Flask application using Docker and Nginx.
The script is idempotent, meaning it can be run multiple times safely without causing failures.

---

## Technologies Used

- Bash
- Docker
- Flask
- Nginx
- Ubuntu (apt package manager)


## What This Script Does

✔ Clones the Flask application repository (or uses existing code)
✔ Installs Docker and Nginx if not already installed
✔ Starts required services
✔ Builds Docker image for the Flask app
✔ Stops and removes existing container (if running)
✔ Runs the Flask application container on port 5000

## How to Run the Script

1. Clone this repository
   
         git clone 
         cd 

2. Give execute permission
 
         chmod +x deploy-flask-app.sh

3. Run the script

         ./deploy-flask-app.sh

4. Access the application

         http://<your-server-ip>:5000
         
---

## Screenshots for referenec

![alt text](<Screenshot from 2025-12-31 16-44-16.png>)

![alt text](<Screenshot from 2025-12-31 16-45-16.png>)

---

If you found this project helpful, feel free to ⭐ star the repository and share feedback.

Happy Learning 🚀✨
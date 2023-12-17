# Containerization Process

## Creating Dockerfile

- **Base Image Selection:** Chose `python:3.8-slim` 
- **Working Directory Setup:** Used `WORKDIR /app` to set the working directory inside the container to `/app`.
- **Copying Application Files:** Used `COPY app.py requirements.txt /app/` to copy application files.
- **System Dependencies and ODBC Driver Installation:** Installed necessary dependencies, ODBC driver, and updated system packages.
- **Python Packages Installation:** Used `pip install -r requirements.txt` to install all the required Python packages.
- **Port Exposure:** Exposed port 5001 using `EXPOSE 5001`.
- **Startup Command:** Set the startup command as `CMD ["python", "app.py"]` to run the Flask application.

## Docker Image Build

```bash
docker build -t my-flask-app:1.0 .
```
## Running the Docker Container Locally
```bash
docker run -p 5001:5000 my-flask-app
```
## Tagging Docker Image
```bash
docker tag my-flask-app yourusername/my-flask-app:1.0
```
## Pushing Docker Image to Docker Hub
```bash
docker push yourusername/my-flask-app:1.0
```
## Pulling and Running Docker Image from Docker Hub
```bash
docker pull yourusername/my-flask-app:1.0
docker run -p 5001:5000 yourusername/my-flask-app:1.0
```
# Image Information

**Docker Image Name:** yourusername/my-flask-app

Tags: 1.0

Docker Hub Repository: 

**Instructions for Use:**

- Pull the image: **docker pull yourusername/my-flask-app:1.0**
- Run the container: **docker run -p** `5001:5000` **yourusername/my-flask-app:1.0**
- Application can be accessed at http://127.0.0.1:5001

This documentation provides a detailed guide on the containerization process, Docker commands, and essential information about the Docker image. Commands and information can be adjusted inline with your specific project details.
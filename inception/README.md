# Automated WordPress Deployment

This project is about creating a script to automatically set up a WordPress website on a server.

## Requirements

- **Automated Setup**: The script must work on Ubuntu 20.04 and install WordPress without any manual steps.
- **Data Persistence**: The site’s data (like images and posts) must stay safe even if the server restarts.
- **Multiple Servers**: You should be able to deploy the site on several servers at the same time.
- **Containers**: Use Docker to run WordPress and its parts in separate containers.
- **Security**: The database should not be directly accessible from the internet.
- **Docker Compose**: Include a `docker-compose.yml` file to manage the containers.

Good luck!

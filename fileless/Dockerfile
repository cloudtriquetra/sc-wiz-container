FROM nginx:latest

# Install necessary tools
RUN apt-get update && apt-get install -y gcc libc6-dev

# Copy the script into the container
COPY memfd_script.sh /memfd_script.sh

# Make the script executable
RUN chmod +x /memfd_script.sh

# Run the script
CMD ["/memfd_script.sh"]
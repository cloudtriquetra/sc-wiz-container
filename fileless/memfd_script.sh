#!/bin/sh

# Create a memory file descriptor
memfd=$(memfd_create memfd_exec -1)

# Write a simple script to the memory file descriptor
echo -e '#!/bin/sh\necho "Running in-memory script"\nsleep 3600' > /proc/self/fd/$memfd

# Make the memory file descriptor executable
chmod +x /proc/self/fd/$memfd

# Execute the in-memory script
exec /proc/self/fd/$memfd
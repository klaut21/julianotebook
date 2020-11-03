# Start and stop the application (powershell required)
# Use 'down, build, up' to see changes during your development sessions
$opts = $args[0]

$msg = "Run script with: 'up', 'start', 'stop', 'down' 'clean'"

# Customize image settings

$image = "julianotebook_web"


# switch parameter input. Sequence: 1.down, 2.build, 3.up
switch ($opts) {    
    up { docker-compose up -d } 
    start { docker-compose start } 
    stop { docker-compose stop } 
    down { docker-compose down -v }
    i { docker images } # shows current images
    c { docker ps -a } # shows current active containers
    v { docker volume ls } # shows active volumes
    build { docker-compose build --no-cache --pull }
    clean { docker rmi $image }
    Default {$msg}
}
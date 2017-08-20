<?php
require 'vendor/autoload.php';

use Ratchet\Server\IoServer;
use Ratchet\WebSocket\WsServer;
use Kapo\Chat\Chat;


    $server = IoServer::factory(
        new WsServer(
            new Chat()
        )
      , 8080
    );

    $server->run();

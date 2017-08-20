package Server.Data;

import Server.ClientObject;

import java.util.HashMap;

public interface Repository {
    /* Store client connections for use of checking what connections are active. */
    HashMap<String, ClientObject> CONNECTIONS = new HashMap<>();
}


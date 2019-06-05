package be.intecbrussel.Blogcentral.dataLayer;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EntityManagerMaker {
    public static EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("blogcentraldb");
    public static EntityManager emCreator(){
        return emf.createEntityManager();
    }

    public static void closeSession() {
        emf.close();
    }

}

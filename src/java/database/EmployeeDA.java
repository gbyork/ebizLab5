package database;

import domain.Employee;
import domain.HourlyEmployee;
import domain.SalaryEmployee;
import exceptions.RecordNotFoundException;

import java.util.ArrayList;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

public class EmployeeDA {
    
    private static ArrayList<Employee> employees = new ArrayList<Employee>(5);
    
    public static void add(Employee emp) {
        employees.add(emp);
    }
    
    public static Employee find(int ID){
        for (int i = 0; i < employees.size(); i++)
            if (employees.get(i).getEmployeeID() == ID)
                return employees.get(i);
        return null;
    }
    //you will be using UserDB example from M10 notes
    //
    public static Employee findByUserID(String userID) throws NoResultException{
        Employee employee = null;
       
        EntityManagerFactory emf = PayrollSystemDA.getEmFactory();
        System.out.println("EmployeeDA.findByUserID  emf = " + emf);
        
        EntityManager em = emf.createEntityManager();
        String qString = "SELECT emp FROM Employee emp " +
        "WHERE emp.userID = :id";
        TypedQuery<Employee> q = em.createQuery(qString, Employee.class);
        q.setParameter("id", userID);
        System.out.println("EmployeeDA.findByUserID q =" + q);
        try {
            employee = q.getSingleResult();
            return employee;
            
        }
        
        catch (NoResultException e) {
        System.out.println("Exception:" + e);
        RecordNotFoundException ex = new RecordNotFoundException("Employee " + userID + " not found.");
        throw e;
           
        } finally {
            em.close();
        }
        // will get error msg entity employee already defined WHAT YOU NEED TO DO
        //As you work on other elements (timecard) you suddenly get error msg
        //Entity employee defined
        //TO FIX THIS YOU RESTART THE SERVER
        //GO TO SERVERS IN SERVICES/GLASSFISH/Application right click restart server
        

    }
    
    public static void initialize(){
        
    }

    public static ArrayList<Employee> getEmployees() {
        return employees;
    }
    
}
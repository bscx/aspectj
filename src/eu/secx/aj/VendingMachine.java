package eu.secx.aj;

import java.util.ArrayList;
import java.util.List;

/*
 * Sources:
 * https://programmer.ink/think/the-simplest-helloworld-example-of-aspectj.html
 * https://github.com/eugenp/tutorials/tree/master/spring-aop/src/main/java/com/baeldung/aspectj
 * https://vfhvws.eduloop.de/loop/Praktische_Übung_mit_AspectJ
 * 
 */


public class VendingMachine {
    static ArrayList<String> shelf = new ArrayList<String>(List.of("apple", "orange", "banana"));

    public static void main(String[] args) {
    	VendingMachine vm = new VendingMachine();
    	vm.retrieve("apple"); 
    	vm.retrieve("apple");
    	vm.retrieve("orange");
    }
        
    public boolean retrieve(String fruit) {
    	if (shelf.contains(fruit)) {
        	shelf.remove(fruit);
        	return true;
    	} else {
    	    return false;
    	}
    }
}
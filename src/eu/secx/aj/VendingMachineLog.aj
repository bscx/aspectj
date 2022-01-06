package eu.secx.aj;

/*
 * Sources:
 * https://programmer.ink/think/the-simplest-helloworld-example-of-aspectj.html
 * https://github.com/eugenp/tutorials/tree/master/spring-aop/src/main/java/com/baeldung/aspectj
 * https://vfhvws.eduloop.de/loop/Praktische_Übung_mit_AspectJ
 * 
 */

public aspect VendingMachineLog {
    pointcut retrieveSnacks(String fruit, VendingMachine vm) : call(boolean VendingMachine.retrieve(String)) && args(fruit) && target(vm);

    before(String fruit, VendingMachine vm) : retrieveSnacks(fruit, vm) {
    	System.out.println("+---------------------+");
    	System.out.println("| Transaction started |");
    	System.out.println("+---------------------+");
    	System.out.println("Available fruits on shelf: " + VendingMachine.shelf.toString());
    }

    boolean around(String fruit, VendingMachine vm) : retrieveSnacks(fruit, vm) {
        System.out.println("Checking shelf for " + fruit);
        boolean returnItems = proceed(fruit, vm);
        
        if (returnItems) {
        	System.out.println("Returning fruit " + fruit);
        } else {
        	System.out.println("You requested a fruit than I don't offer!");
        }
        
        return returnItems;
    }

    after(String fruit, VendingMachine vm) : retrieveSnacks(fruit, vm) {
    	System.out.println("Remaining fruits on shelf: " + VendingMachine.shelf.toString());
    	System.out.println("+---------------------+");
    	System.out.println("| Transaction ended   |");
    	System.out.println("+---------------------+");
    	System.out.println("");
    }
}
package prueba_practica;

import java.util.Scanner;

public class PRUEBA_PRACTICA3 {

    public static void main(String[] args) {
        int altura;

        Scanner sc = new Scanner(System.in);
        System.out.print("¿Cuál es tú altura? ");
        altura = sc.nextInt();

        if (altura <= 150) {

            System.out.println("PERSONA DE ALTURA BAJA");

        } else if (altura <= 170) {

            System.out.println("PERSONA DE ALTURA MEDIA");
            
        } else if (altura > 170) {
            
            System.out.println("PERSONA ALTA");
        }

    }

}


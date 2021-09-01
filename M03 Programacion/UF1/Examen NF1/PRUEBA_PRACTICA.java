package prueba_practica;

import java.util.Scanner;

public class PRUEBA_PRACTICA {

    public static void main(String[] args) {
        int porcentaje, ocupacion, tasa_contagios, num_habit;

        Scanner sc = new Scanner(System.in);

        System.out.println("¿De cuánto  es el porcentaje de PCR?");
        porcentaje = sc.nextInt();

        System.out.println("De cuánto es el porcentaje de UCI");
        ocupacion = sc.nextInt();

        System.out.println("¿De cuánto es la tasa de contagios?");
        tasa_contagios = sc.nextInt();

        System.out.println("¿Cuántos habitantes hay?");
        num_habit = sc.nextInt();

        if (num_habit > 100000) {

            if (porcentaje > 10 && ocupacion > 30 && tasa_contagios > 500) {

                System.out.println("Se imponene medidas muy restrictivas (cerca al confinamiento)");

            } else if (porcentaje > 8 && tasa_contagios > 300) {

                System.out.println("Se impone cerrar los bares y restaurantes.");
                
            } else {
                
                System.out.println("No se aplican nuevas medidas");
            }

        } else {

            if (tasa_contagios > 500) {

                System.out.println("Los bares cerrarán a partir de las 12 horas.");

            } else {
                
                System.out.println("No se aplican nuevas medidas.");
                
            }
        }

    }

}

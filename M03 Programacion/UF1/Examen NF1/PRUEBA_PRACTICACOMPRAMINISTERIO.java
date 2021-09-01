package prueba_practica;

import java.util.Scanner;

public class PRUEBA_PRACTICACOMPRAMINISTERIO {

    public static void main(String[] args) {

        double moneda = 0, euro = 0, conversor = 0;

        Scanner sc = new Scanner(System.in);
        System.out.println("Escoge a que quieres conventir eur a yen(1) o euro a $(2)? ");
        moneda = sc.nextInt();

        System.out.println("Cuantos euros tienes?");
        euro = sc.nextFloat();

        if (moneda == 1) {

            conversor = euro * 123.51;

        } else if (moneda == 2) {

            conversor = euro * 1.17;
        }

        System.out.println("Tu cambio de moneda es: " + conversor);

    }

}

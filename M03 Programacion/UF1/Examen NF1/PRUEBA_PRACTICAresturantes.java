package prueba_practica;

import java.util.Scanner;

public class PRUEBA_PRACTICAresturantes {

    public static void main(String[] args) {

        double num_menus, menu_infa, total_pagar = 0, total_pagar_final = 0;

        Scanner sc = new Scanner(System.in);

        System.out.print("¿Número de menús a pedir? ");
        num_menus = sc.nextDouble();

        System.out.print("¿Cuántos menús infantiles? ");
        menu_infa = sc.nextDouble();

        Scanner pedir = new Scanner(System.in);
        System.out.print("¿(R)ecogida o (D)omicilio?");
        char recogida = pedir.nextLine().charAt(0);

        total_pagar = num_menus * 10 + menu_infa * 8;
        total_pagar_final = total_pagar;

        if (recogida == 'R' || recogida =='r') {

            total_pagar = total_pagar * 0.90;
       
            if (total_pagar > 60) {

                total_pagar = total_pagar * 0.90;
               
            }

        } else if (total_pagar > 40) {

            total_pagar = total_pagar * 0.95;

        }

        System.out.println("Total a pagar " + total_pagar_final);
        System.out.println("Tú descuento final con descuento " +  total_pagar);

    }

}

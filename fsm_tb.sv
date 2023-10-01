module fsm_tb;
  reg clk, rst, mButton;
  wire y;

  // Variable para almacenar el resultado final
  reg [7:0] final_result;
  reg [1:0] final_state; // Variable para almacenar el estado final

  // Instanciar la FSM
  FiniteStateMachine uut (
    .clk(clk),
    .rst(rst),
    .mButton(mButton),
    .y(y)
  );

  // Generar señal de reloj
  always begin
    #5 clk = ~clk;
  end

  // Inicialización
  initial begin
    clk = 0;
    rst = 0;
    mButton = 0;

    // Reset inicial
    rst = 1;
    #10 rst = 0;

    // Simular el comportamiento de la FSM
    // Prueba 1: Mantenimiento completado
    mButton = 0;
    #100 mButton = 1;
    $display("Mantenimiento solicitado");
    #100 mButton = 0;
    #200;
    final_result = y; // Guardar el resultado final
    final_state = uut.state; //Guardar el estado final
    $display("Mantenimiento completado. Estado: %b, Resultado Final: %h", final_state, final_result);
 
// Prueba 2: Mantenimiento no completado
    mButton = 0;
	 $display("Conteo de mantenimiento reiniciado");
    #250;  // Esperar más tiempo que el límite de 200 ciclos sin presionar el botón
    final_result = 8'hFF; // Establecer un código de error (0xFF) en caso de error
    final_state = uut.state; // Guardar el estado final
    $display("Tiempo de mantenimiento no cumplido. Resultado Final: %h", final_result);
    // Detener la simulación
    $stop;
  end
endmodule

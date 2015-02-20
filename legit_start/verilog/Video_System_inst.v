  //Example instantiation for system 'Video_System'
  Video_System Video_System_inst
    (
      .SRAM_ADDR_from_the_Pixel_Buffer      (SRAM_ADDR_from_the_Pixel_Buffer),
      .SRAM_CE_N_from_the_Pixel_Buffer      (SRAM_CE_N_from_the_Pixel_Buffer),
      .SRAM_DQ_to_and_from_the_Pixel_Buffer (SRAM_DQ_to_and_from_the_Pixel_Buffer),
      .SRAM_LB_N_from_the_Pixel_Buffer      (SRAM_LB_N_from_the_Pixel_Buffer),
      .SRAM_OE_N_from_the_Pixel_Buffer      (SRAM_OE_N_from_the_Pixel_Buffer),
      .SRAM_UB_N_from_the_Pixel_Buffer      (SRAM_UB_N_from_the_Pixel_Buffer),
      .SRAM_WE_N_from_the_Pixel_Buffer      (SRAM_WE_N_from_the_Pixel_Buffer),
      .VGA_BLANK_from_the_VGA_Controller    (VGA_BLANK_from_the_VGA_Controller),
      .VGA_B_from_the_VGA_Controller        (VGA_B_from_the_VGA_Controller),
      .VGA_CLK_from_the_VGA_Controller      (VGA_CLK_from_the_VGA_Controller),
      .VGA_G_from_the_VGA_Controller        (VGA_G_from_the_VGA_Controller),
      .VGA_HS_from_the_VGA_Controller       (VGA_HS_from_the_VGA_Controller),
      .VGA_R_from_the_VGA_Controller        (VGA_R_from_the_VGA_Controller),
      .VGA_SYNC_from_the_VGA_Controller     (VGA_SYNC_from_the_VGA_Controller),
      .VGA_VS_from_the_VGA_Controller       (VGA_VS_from_the_VGA_Controller),
      .clk                                  (clk),
      .in_port_to_the_pio_0                 (in_port_to_the_pio_0),
      .reset_n                              (reset_n),
      .sys_clk                              (sys_clk),
      .vga_clk                              (vga_clk)
    );


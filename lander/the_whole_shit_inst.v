  //Example instantiation for system 'the_whole_shit'
  the_whole_shit the_whole_shit_inst
    (
      .SRAM_ADDR_from_the_pixel_buffer      (SRAM_ADDR_from_the_pixel_buffer),
      .SRAM_CE_N_from_the_pixel_buffer      (SRAM_CE_N_from_the_pixel_buffer),
      .SRAM_DQ_to_and_from_the_pixel_buffer (SRAM_DQ_to_and_from_the_pixel_buffer),
      .SRAM_LB_N_from_the_pixel_buffer      (SRAM_LB_N_from_the_pixel_buffer),
      .SRAM_OE_N_from_the_pixel_buffer      (SRAM_OE_N_from_the_pixel_buffer),
      .SRAM_UB_N_from_the_pixel_buffer      (SRAM_UB_N_from_the_pixel_buffer),
      .SRAM_WE_N_from_the_pixel_buffer      (SRAM_WE_N_from_the_pixel_buffer),
      .VGA_BLANK_from_the_vga_controller    (VGA_BLANK_from_the_vga_controller),
      .VGA_B_from_the_vga_controller        (VGA_B_from_the_vga_controller),
      .VGA_CLK_from_the_vga_controller      (VGA_CLK_from_the_vga_controller),
      .VGA_G_from_the_vga_controller        (VGA_G_from_the_vga_controller),
      .VGA_HS_from_the_vga_controller       (VGA_HS_from_the_vga_controller),
      .VGA_R_from_the_vga_controller        (VGA_R_from_the_vga_controller),
      .VGA_SYNC_from_the_vga_controller     (VGA_SYNC_from_the_vga_controller),
      .VGA_VS_from_the_vga_controller       (VGA_VS_from_the_vga_controller),
      .clk_0                                (clk_0),
      .clocks_0_VGA_CLK_out                 (clocks_0_VGA_CLK_out),
      .clocks_0_sys_clk_out                 (clocks_0_sys_clk_out),
      .reset_n                              (reset_n)
    );


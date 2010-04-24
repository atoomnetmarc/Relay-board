//POVRay-File created by 3d41.ulp v1.10 RC3
//Z:/webmaster/Eagle Projects/Relay bordje/MB006-A/MB006-A.brd
//27-4-2010 20:24:59

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare env = off;

#local cam_x = 0;
#local cam_y = 327;
#local cam_z = -175;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -7;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 16;
#local lgt1_pos_y = 43;
#local lgt1_pos_z = 40;
#local lgt1_intense = 0.748387;
#local lgt2_pos_x = -16;
#local lgt2_pos_y = 43;
#local lgt2_pos_z = 40;
#local lgt2_intense = 0.748387;
#local lgt3_pos_x = 16;
#local lgt3_pos_y = 43;
#local lgt3_pos_z = -27;
#local lgt3_intense = 0.748387;
#local lgt4_pos_x = -16;
#local lgt4_pos_y = 43;
#local lgt4_pos_z = -27;
#local lgt4_intense = 0.748387;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 44.450000;
#declare pcb_y_size = 76.200000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(4);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(env=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-22.225000,0,-38.100000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MB006_A(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><44.450000,0.000000>
<44.450000,0.000000><44.450000,76.200000>
<44.450000,76.200000><0.000000,76.190000>
<0.000000,76.190000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<3.810000,1,72.390000><3.810000,-5,72.390000>1.600000 texture{col_hls}}
cylinder{<40.640000,1,72.390000><40.640000,-5,72.390000>1.600000 texture{col_hls}}
cylinder{<40.640000,1,3.810000><40.640000,-5,3.810000>1.600000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_X1) #declare global_pack_X1=yes; object {ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.640000,0.000000,15.240000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) X1  AK500/3
#ifndef(pack_X2) #declare global_pack_X2=yes; object {ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.640000,0.000000,30.480000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) X2  AK500/3
#ifndef(pack_X3) #declare global_pack_X3=yes; object {ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.640000,0.000000,45.720000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) X3  AK500/3
#ifndef(pack_X4) #declare global_pack_X4=yes; object {ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<40.640000,0.000000,60.960000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) X4  AK500/3
#ifndef(pack_X5) #declare global_pack_X5=yes; object {ARK_5MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.810000,0.000000,12.700000>}#end		//Screw Terminal conn. 2Pin (con-ptr500.lib) X5  AK500/2
#ifndef(pack_X6) #declare global_pack_X6=yes; object {ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.810000,0.000000,50.800000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) X6  AK500/3
#ifndef(pack_X7) #declare global_pack_X7=yes; object {ARK_5MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.810000,0.000000,63.500000>}#end		//Screw Terminal conn. 2Pin (con-ptr500.lib) X7  AK500/2
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,5.461000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,17.399000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,17.399000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<13.335000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,5.461000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,23.241000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,35.179000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,35.179000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<13.335000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_K2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,23.241000> texture{col_thl}}
#ifndef(global_pack_K3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,41.021000> texture{col_thl}}
#ifndef(global_pack_K3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,52.959000> texture{col_thl}}
#ifndef(global_pack_K3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,52.959000> texture{col_thl}}
#ifndef(global_pack_K3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<13.335000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_K3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,41.021000> texture{col_thl}}
#ifndef(global_pack_K4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,58.801000> texture{col_thl}}
#ifndef(global_pack_K4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<15.367000,0,70.739000> texture{col_thl}}
#ifndef(global_pack_K4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,70.739000> texture{col_thl}}
#ifndef(global_pack_K4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<13.335000,0,64.770000> texture{col_thl}}
#ifndef(global_pack_K4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.559000,0,58.801000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,10.236200> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,20.243800> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,25.476200> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,35.483800> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,40.716200> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,50.723800> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,55.956200> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,60.960000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<40.640000,0,65.963800> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,15.214600> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,10.185400> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,55.803800> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,45.796200> texture{col_thl}}
#ifndef(global_pack_X7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,66.014600> texture{col_thl}}
#ifndef(global_pack_X7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.981200,1.320800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<3.810000,0,60.985400> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.810000,0.000000,60.985400>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.835400,0.000000,60.960000>}
box{<0,0,-0.635000><0.035921,0.035000,0.635000> rotate<0,44.997030,0> translate<3.810000,0.000000,60.985400> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.810000,0.000000,66.014600>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.835400,0.000000,66.040000>}
box{<0,0,-0.635000><0.035921,0.035000,0.635000> rotate<0,-44.997030,0> translate<3.810000,0.000000,66.014600> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.810000,-1.535000,45.796200>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.886200,-1.535000,45.720000>}
box{<0,0,-0.635000><0.107763,0.035000,0.635000> rotate<0,44.997030,0> translate<3.810000,-1.535000,45.796200> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.810000,0.000000,55.803800>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.886200,0.000000,55.880000>}
box{<0,0,-0.635000><0.107763,0.035000,0.635000> rotate<0,-44.997030,0> translate<3.810000,0.000000,55.803800> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.810000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.350000,0.000000,50.800000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<3.810000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<6.350000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,49.530000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<6.350000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,49.530000>}
box{<0,0,-0.635000><27.940000,0.035000,0.635000> rotate<0,90.000000,0> translate<7.620000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.886200,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,55.880000>}
box{<0,0,-0.635000><3.733800,0.035000,0.635000> rotate<0,0.000000,0> translate<3.886200,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.835400,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,60.960000>}
box{<0,0,-0.635000><3.784600,0.035000,0.635000> rotate<0,0.000000,0> translate<3.835400,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.835400,0.000000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,66.040000>}
box{<0,0,-0.635000><3.784600,0.035000,0.635000> rotate<0,0.000000,0> translate<3.835400,0.000000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,18.732500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,34.290000>}
box{<0,0,-0.635000><15.557500,0.035000,0.635000> rotate<0,90.000000,0> translate<8.890000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<3.886200,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,45.720000>}
box{<0,0,-0.635000><5.003800,0.035000,0.635000> rotate<0,0.000000,0> translate<3.886200,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,45.720000>}
box{<0,0,-0.635000><8.890000,0.035000,0.635000> rotate<0,90.000000,0> translate<8.890000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,51.752500>}
box{<0,0,-0.635000><6.032500,0.035000,0.635000> rotate<0,90.000000,0> translate<8.890000,-1.535000,51.752500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,69.215000>}
box{<0,0,-0.635000><14.605000,0.035000,0.635000> rotate<0,90.000000,0> translate<8.890000,-1.535000,69.215000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.779000,-1.535000,35.179000>}
box{<0,0,-0.635000><1.257236,0.035000,0.635000> rotate<0,-44.997030,0> translate<8.890000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,18.732500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,17.462500>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<8.890000,-1.535000,18.732500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,19.050000>}
box{<0,0,-0.635000><3.592102,0.035000,0.635000> rotate<0,44.997030,0> translate<7.620000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,19.050000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<10.160000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<9.779000,-1.535000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,35.179000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,0.000000,0> translate<9.779000,-1.535000,35.179000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,35.560000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<8.890000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,35.560000>}
box{<0,0,-0.635000><0.381000,0.035000,0.635000> rotate<0,90.000000,0> translate<10.160000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,51.752500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,53.022500>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<8.890000,-1.535000,51.752500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,53.340000>}
box{<0,0,-0.635000><3.592102,0.035000,0.635000> rotate<0,44.997030,0> translate<7.620000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,53.340000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<8.890000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,53.340000>}
box{<0,0,-0.635000><29.210000,0.035000,0.635000> rotate<0,90.000000,0> translate<10.160000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,53.022500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,53.340000>}
box{<0,0,-0.635000><0.317500,0.035000,0.635000> rotate<0,90.000000,0> translate<10.160000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<8.890000,-1.535000,69.215000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,70.485000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,-44.997030,0> translate<8.890000,-1.535000,69.215000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.049000,0.000000,5.461000>}
box{<0,0,-0.635000><1.257236,0.035000,0.635000> rotate<0,44.997030,0> translate<10.160000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.049000,0.000000,23.241000>}
box{<0,0,-0.635000><1.257236,0.035000,0.635000> rotate<0,44.997030,0> translate<10.160000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.430000,0.000000,62.230000>}
box{<0,0,-0.635000><5.388154,0.035000,0.635000> rotate<0,44.997030,0> translate<7.620000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<7.620000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.700000,0.000000,55.880000>}
box{<0,0,-0.635000><7.184205,0.035000,0.635000> rotate<0,44.997030,0> translate<7.620000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.430000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.970000,0.000000,62.230000>}
box{<0,0,-0.635000><2.540000,0.035000,0.635000> rotate<0,0.000000,0> translate<11.430000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.113000,-1.535000,70.485000>}
box{<0,0,-0.635000><4.953000,0.035000,0.635000> rotate<0,0.000000,0> translate<10.160000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.303500,-1.535000,17.462500>}
box{<0,0,-0.635000><5.143500,0.035000,0.635000> rotate<0,0.000000,0> translate<10.160000,-1.535000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,53.022500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.303500,-1.535000,53.022500>}
box{<0,0,-0.635000><5.143500,0.035000,0.635000> rotate<0,0.000000,0> translate<10.160000,-1.535000,53.022500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.049000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,5.461000>}
box{<0,0,-0.635000><4.318000,0.035000,0.635000> rotate<0,0.000000,0> translate<11.049000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.303500,-1.535000,17.462500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,-1.535000,17.399000>}
box{<0,0,-0.635000><0.089803,0.035000,0.635000> rotate<0,44.997030,0> translate<15.303500,-1.535000,17.462500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<11.049000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,23.241000>}
box{<0,0,-0.635000><4.318000,0.035000,0.635000> rotate<0,0.000000,0> translate<11.049000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<10.160000,-1.535000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,-1.535000,35.179000>}
box{<0,0,-0.635000><5.207000,0.035000,0.635000> rotate<0,0.000000,0> translate<10.160000,-1.535000,35.179000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.303500,-1.535000,53.022500>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,-1.535000,52.959000>}
box{<0,0,-0.635000><0.089803,0.035000,0.635000> rotate<0,44.997030,0> translate<15.303500,-1.535000,53.022500> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,60.833000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,58.801000>}
box{<0,0,-0.635000><2.032000,0.035000,0.635000> rotate<0,-90.000000,0> translate<15.367000,0.000000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<13.970000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,60.833000>}
box{<0,0,-0.635000><1.975656,0.035000,0.635000> rotate<0,44.997030,0> translate<13.970000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.113000,-1.535000,70.485000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,-1.535000,70.739000>}
box{<0,0,-0.635000><0.359210,0.035000,0.635000> rotate<0,-44.997030,0> translate<15.113000,-1.535000,70.485000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<12.700000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.780000,0.000000,55.880000>}
box{<0,0,-0.635000><5.080000,0.035000,0.635000> rotate<0,0.000000,0> translate<12.700000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<15.367000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.161000,0.000000,41.021000>}
box{<0,0,-0.635000><2.794000,0.035000,0.635000> rotate<0,0.000000,0> translate<15.367000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<18.161000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,0.000000,41.910000>}
box{<0,0,-0.635000><1.257236,0.035000,0.635000> rotate<0,-44.997030,0> translate<18.161000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<17.780000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,0.000000,54.610000>}
box{<0,0,-0.635000><1.796051,0.035000,0.635000> rotate<0,44.997030,0> translate<17.780000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.050000,0.000000,54.610000>}
box{<0,0,-0.635000><12.700000,0.035000,0.635000> rotate<0,90.000000,0> translate<19.050000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.559000,-1.535000,35.179000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.863800,-1.535000,35.483800>}
box{<0,0,-0.635000><0.431052,0.035000,0.635000> rotate<0,-44.997030,0> translate<27.559000,-1.535000,35.179000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.559000,-1.535000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<27.863800,-1.535000,40.716200>}
box{<0,0,-0.635000><0.431052,0.035000,0.635000> rotate<0,44.997030,0> translate<27.559000,-1.535000,41.021000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,23.241000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<29.794200,-1.535000,25.476200>}
box{<0,0,-1.092200><3.161050,0.035000,1.092200> rotate<0,-44.997030,0> translate<27.559000,-1.535000,23.241000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,52.959000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<29.794200,-1.535000,50.723800>}
box{<0,0,-1.092200><3.161050,0.035000,1.092200> rotate<0,44.997030,0> translate<27.559000,-1.535000,52.959000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<30.403800,-1.535000,20.243800>}
box{<0,0,-1.092200><4.023155,0.035000,1.092200> rotate<0,-44.997030,0> translate<27.559000,-1.535000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,58.801000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<30.403800,-1.535000,55.956200>}
box{<0,0,-1.092200><4.023155,0.035000,1.092200> rotate<0,44.997030,0> translate<27.559000,-1.535000,58.801000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<32.334200,-1.535000,10.236200>}
box{<0,0,-1.092200><6.753153,0.035000,1.092200> rotate<0,-44.997030,0> translate<27.559000,-1.535000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.559000,-1.535000,70.739000>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<32.334200,-1.535000,65.963800>}
box{<0,0,-1.092200><6.753153,0.035000,1.092200> rotate<0,44.997030,0> translate<27.559000,-1.535000,70.739000> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<32.334200,-1.535000,10.236200>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,10.236200>}
box{<0,0,-1.092200><8.305800,0.035000,1.092200> rotate<0,0.000000,0> translate<32.334200,-1.535000,10.236200> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<30.403800,-1.535000,20.243800>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,20.243800>}
box{<0,0,-1.092200><10.236200,0.035000,1.092200> rotate<0,0.000000,0> translate<30.403800,-1.535000,20.243800> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<29.794200,-1.535000,25.476200>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,25.476200>}
box{<0,0,-1.092200><10.845800,0.035000,1.092200> rotate<0,0.000000,0> translate<29.794200,-1.535000,25.476200> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.863800,-1.535000,35.483800>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,35.483800>}
box{<0,0,-1.092200><12.776200,0.035000,1.092200> rotate<0,0.000000,0> translate<27.863800,-1.535000,35.483800> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<27.863800,-1.535000,40.716200>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,40.716200>}
box{<0,0,-1.092200><12.776200,0.035000,1.092200> rotate<0,0.000000,0> translate<27.863800,-1.535000,40.716200> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<29.794200,-1.535000,50.723800>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,50.723800>}
box{<0,0,-1.092200><10.845800,0.035000,1.092200> rotate<0,0.000000,0> translate<29.794200,-1.535000,50.723800> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<30.403800,-1.535000,55.956200>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,55.956200>}
box{<0,0,-1.092200><10.236200,0.035000,1.092200> rotate<0,0.000000,0> translate<30.403800,-1.535000,55.956200> }
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<32.334200,-1.535000,65.963800>}
cylinder{<0,0,0><0,0.035000,0>1.092200 translate<40.640000,-1.535000,65.963800>}
box{<0,0,-1.092200><8.305800,0.035000,1.092200> rotate<0,0.000000,0> translate<32.334200,-1.535000,65.963800> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,76.200000>}
box{<0,0,-0.127000><76.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<0.000000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,76.200000>}
box{<0,0,-0.127000><76.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<0.000000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,0.000000>}
box{<0,0,-0.127000><44.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,0.000000>}
box{<0,0,-0.127000><44.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,76.200000>}
box{<0,0,-0.127000><44.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,0.000000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<0.000000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,76.200000>}
box{<0,0,-0.127000><44.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<0.000000,-1.535000,76.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,0.000000>}
box{<0,0,-0.127000><76.200000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.450000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,76.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,0.000000>}
box{<0,0,-0.127000><76.200000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.450000,-1.535000,0.000000> }
texture{col_pol}
}
#end
union{
cylinder{<15.367000,0.038000,5.461000><15.367000,-1.538000,5.461000>0.660400}
cylinder{<15.367000,0.038000,17.399000><15.367000,-1.538000,17.399000>0.660400}
cylinder{<27.559000,0.038000,17.399000><27.559000,-1.538000,17.399000>0.660400}
cylinder{<13.335000,0.038000,11.430000><13.335000,-1.538000,11.430000>0.660400}
cylinder{<27.559000,0.038000,5.461000><27.559000,-1.538000,5.461000>0.660400}
cylinder{<15.367000,0.038000,23.241000><15.367000,-1.538000,23.241000>0.660400}
cylinder{<15.367000,0.038000,35.179000><15.367000,-1.538000,35.179000>0.660400}
cylinder{<27.559000,0.038000,35.179000><27.559000,-1.538000,35.179000>0.660400}
cylinder{<13.335000,0.038000,29.210000><13.335000,-1.538000,29.210000>0.660400}
cylinder{<27.559000,0.038000,23.241000><27.559000,-1.538000,23.241000>0.660400}
cylinder{<15.367000,0.038000,41.021000><15.367000,-1.538000,41.021000>0.660400}
cylinder{<15.367000,0.038000,52.959000><15.367000,-1.538000,52.959000>0.660400}
cylinder{<27.559000,0.038000,52.959000><27.559000,-1.538000,52.959000>0.660400}
cylinder{<13.335000,0.038000,46.990000><13.335000,-1.538000,46.990000>0.660400}
cylinder{<27.559000,0.038000,41.021000><27.559000,-1.538000,41.021000>0.660400}
cylinder{<15.367000,0.038000,58.801000><15.367000,-1.538000,58.801000>0.660400}
cylinder{<15.367000,0.038000,70.739000><15.367000,-1.538000,70.739000>0.660400}
cylinder{<27.559000,0.038000,70.739000><27.559000,-1.538000,70.739000>0.660400}
cylinder{<13.335000,0.038000,64.770000><13.335000,-1.538000,64.770000>0.660400}
cylinder{<27.559000,0.038000,58.801000><27.559000,-1.538000,58.801000>0.660400}
cylinder{<40.640000,0.038000,10.236200><40.640000,-1.538000,10.236200>0.660400}
cylinder{<40.640000,0.038000,15.240000><40.640000,-1.538000,15.240000>0.660400}
cylinder{<40.640000,0.038000,20.243800><40.640000,-1.538000,20.243800>0.660400}
cylinder{<40.640000,0.038000,25.476200><40.640000,-1.538000,25.476200>0.660400}
cylinder{<40.640000,0.038000,30.480000><40.640000,-1.538000,30.480000>0.660400}
cylinder{<40.640000,0.038000,35.483800><40.640000,-1.538000,35.483800>0.660400}
cylinder{<40.640000,0.038000,40.716200><40.640000,-1.538000,40.716200>0.660400}
cylinder{<40.640000,0.038000,45.720000><40.640000,-1.538000,45.720000>0.660400}
cylinder{<40.640000,0.038000,50.723800><40.640000,-1.538000,50.723800>0.660400}
cylinder{<40.640000,0.038000,55.956200><40.640000,-1.538000,55.956200>0.660400}
cylinder{<40.640000,0.038000,60.960000><40.640000,-1.538000,60.960000>0.660400}
cylinder{<40.640000,0.038000,65.963800><40.640000,-1.538000,65.963800>0.660400}
cylinder{<3.810000,0.038000,15.214600><3.810000,-1.538000,15.214600>0.660400}
cylinder{<3.810000,0.038000,10.185400><3.810000,-1.538000,10.185400>0.660400}
cylinder{<3.810000,0.038000,55.803800><3.810000,-1.538000,55.803800>0.660400}
cylinder{<3.810000,0.038000,50.800000><3.810000,-1.538000,50.800000>0.660400}
cylinder{<3.810000,0.038000,45.796200><3.810000,-1.538000,45.796200>0.660400}
cylinder{<3.810000,0.038000,66.014600><3.810000,-1.538000,66.014600>0.660400}
cylinder{<3.810000,0.038000,60.985400><3.810000,-1.538000,60.985400>0.660400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,9.245600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,9.245600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,9.245600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,9.245600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,9.872600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,9.245600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,9.872600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,9.872600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,9.872600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,10.651400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,10.337800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,10.337800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,10.337800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,10.181100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,10.337800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,10.181100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,10.181100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,10.181100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,10.181100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,10.337800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,10.181100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,10.337800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,10.651400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,10.651400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,10.651400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,10.808100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,10.808100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,10.808100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,10.808100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,10.808100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,10.808100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,10.651400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,10.651400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,11.116600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,11.430100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,11.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,11.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,11.430100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,11.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,11.116600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,11.743600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,11.743600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,14.550100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,14.393400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,14.393400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,14.393400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,14.079800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,14.079800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,14.079800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,13.923100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,14.079800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,13.923100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,13.923100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,13.923100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,13.923100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,14.079800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,13.923100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,14.079800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,14.393400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,14.393400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,14.393400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,14.550100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,14.550100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.328900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.015300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,15.015300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.015300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,14.858600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,15.015300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,14.858600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,14.858600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,14.858600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,14.858600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,15.015300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,14.858600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,15.015300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,15.328900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,15.328900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,15.328900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,15.485600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,15.485600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,15.485600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,15.485600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,15.485600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,15.485600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.328900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,15.328900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,15.794100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.794100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,15.794100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,15.794100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,16.107600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<34.581300,0.000000,15.794100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,16.107600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,16.421100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,16.421100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,16.421100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,16.421100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,16.421100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,18.600600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,18.600600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,18.600600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,18.600600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,19.227600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,18.600600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,19.227600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,19.227600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,19.227600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,20.163100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,20.006400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,20.006400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,20.006400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,19.692800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,19.692800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,19.692800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,19.536100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,19.692800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,19.536100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,19.536100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,19.536100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,19.536100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,19.692800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,19.536100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,19.692800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,20.006400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,20.006400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,20.006400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,20.163100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,20.163100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,20.471600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,20.785100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,20.785100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,20.785100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,20.785100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,20.785100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,20.471600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,21.098600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,21.098600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,24.485600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,24.485600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,24.485600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,24.485600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.112600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,24.485600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.112600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,25.112600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,25.112600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,25.891400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,25.577800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,25.421100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,25.577800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,25.421100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,25.421100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,25.421100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,25.421100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.577800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,25.421100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.577800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.891400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,25.891400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,25.891400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,26.048100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,26.048100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,26.048100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,26.048100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,26.048100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,26.048100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,25.891400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,25.891400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,26.983600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,26.356600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.521900,0.000000,26.356600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,26.356600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,26.983600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<34.894900,0.000000,26.983600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,26.983600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,26.983600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,26.983600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,26.983600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,26.826900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,26.826900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,26.826900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,26.513300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,26.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,26.513300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,26.356600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,26.513300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,29.790100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,29.633400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,29.633400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,29.633400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,29.319800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,29.319800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,29.319800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,29.163100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,29.319800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,29.163100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,29.163100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,29.163100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,29.163100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,29.319800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,29.163100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,29.319800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,29.633400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,29.633400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,29.633400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,29.790100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,29.790100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,30.255300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,30.255300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,30.255300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,30.098600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,30.255300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,30.098600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,30.098600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,30.098600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,30.098600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,30.255300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,30.098600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,30.255300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,30.568900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,30.568900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,30.725600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,30.725600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,30.725600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,30.725600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,30.725600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,30.725600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,30.568900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,30.568900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,31.034100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,31.034100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,31.034100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,31.034100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,31.347600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<34.581300,0.000000,31.034100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,31.347600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,31.661100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,31.661100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,31.661100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,31.661100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,31.661100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,33.840600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,33.840600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,33.840600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,33.840600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,34.467600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,33.840600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,34.467600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,34.467600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,34.467600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,35.403100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,35.246400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,35.246400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,35.246400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,34.932800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,34.932800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,34.932800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,34.776100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,34.932800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,34.776100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,34.776100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,34.776100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,34.776100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,34.932800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,34.776100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,34.932800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,35.246400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,35.246400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,35.246400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,35.403100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,35.403100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,36.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,35.711600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.521900,0.000000,35.711600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,35.711600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,36.338600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<34.894900,0.000000,36.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,36.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,36.338600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,36.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,36.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,36.181900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,36.181900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,36.181900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,35.868300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,35.868300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,35.868300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,35.711600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,35.868300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,39.725600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,39.725600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,39.725600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,39.725600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,40.352600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,39.725600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,40.352600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,40.352600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,40.352600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,41.131400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,40.817800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,40.817800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,40.817800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,40.661100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,40.817800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,40.661100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,40.661100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,40.661100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,40.661100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,40.817800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,40.661100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,40.817800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,41.131400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,41.131400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,41.131400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,41.288100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,41.288100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,41.288100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,41.288100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,41.288100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,41.288100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,41.131400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,41.131400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,41.596600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,41.753300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,41.753300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,41.753300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,42.066900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<34.581300,0.000000,42.066900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,42.066900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,42.223600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,42.066900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,42.223600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,42.223600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,42.223600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,42.223600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,42.066900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.894900,0.000000,42.223600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,42.066900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,41.910100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.051600,0.000000,41.910100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,42.066900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,42.223600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<35.051600,0.000000,42.066900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,42.223600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,42.223600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.208400,0.000000,42.223600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,42.223600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,42.066900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,42.223600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,42.066900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,41.753300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.521900,0.000000,41.753300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,41.753300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,41.596600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,41.596600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,45.030100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,44.873400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,44.873400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,44.873400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,44.559800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,44.559800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,44.559800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,44.403100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,44.559800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,44.403100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,44.403100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,44.403100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,44.403100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,44.559800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,44.403100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,44.559800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,44.873400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,44.873400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,44.873400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,45.030100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,45.030100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,45.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,45.495300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,45.495300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,45.495300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,45.338600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,45.495300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,45.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,45.338600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,45.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,45.338600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,45.495300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,45.338600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,45.495300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,45.808900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,45.808900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,45.808900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,45.965600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,45.965600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,45.965600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,45.965600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,45.965600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,45.965600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,45.808900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,45.808900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,46.274100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,46.274100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,46.274100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,46.274100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,46.587600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<34.581300,0.000000,46.274100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,46.587600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,46.901100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,46.901100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,46.901100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,46.901100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,46.901100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,49.080600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,49.080600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,49.080600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,49.080600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,49.707600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,49.080600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,49.707600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,49.707600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,49.707600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,50.643100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,50.486400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,50.486400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,50.486400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,50.172800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,50.172800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,50.172800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,50.016100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,50.172800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,50.016100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,50.016100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,50.016100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,50.016100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,50.172800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,50.016100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,50.172800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,50.486400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,50.486400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,50.486400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,50.643100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,50.643100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,50.951600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,51.108300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,51.108300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,51.108300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,51.421900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<34.581300,0.000000,51.421900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,51.421900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,51.578600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,51.421900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,51.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,51.578600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,51.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,51.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,51.421900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.894900,0.000000,51.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,51.421900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,51.265100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.051600,0.000000,51.265100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,51.421900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,51.578600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<35.051600,0.000000,51.421900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,51.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,51.578600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<35.208400,0.000000,51.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,51.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,51.421900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,51.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,51.421900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,51.108300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.521900,0.000000,51.108300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,51.108300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,50.951600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,50.951600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,54.965600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,54.965600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,54.965600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,54.965600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,55.592600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,54.965600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,55.592600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,55.592600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,55.592600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,56.371400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,56.057800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,56.057800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,56.057800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,55.901100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,56.057800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,55.901100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,55.901100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,55.901100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,55.901100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,56.057800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,55.901100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,56.057800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,56.371400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,56.371400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,56.371400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,56.528100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,56.528100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,56.528100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,56.528100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,56.528100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,56.528100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,56.371400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,56.371400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,57.306900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,57.306900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,57.306900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,57.306900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,56.836600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<34.581300,0.000000,57.306900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,56.836600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,57.463600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<35.051600,0.000000,57.463600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,60.270100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,60.113400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,60.113400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,60.113400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,59.799800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,59.799800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,59.799800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,59.643100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,59.799800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,59.643100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,59.643100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,59.643100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,59.643100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,59.799800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,59.643100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,59.799800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,60.113400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,60.113400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,60.113400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,60.270100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,60.270100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,61.048900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,60.735300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,60.735300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,60.735300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,60.578600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,60.735300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,60.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,60.578600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,60.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,60.578600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,60.735300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,60.578600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,60.735300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,61.048900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,61.048900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,61.048900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,61.205600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,61.205600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,61.205600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,61.205600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,61.205600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,61.205600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,61.048900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,61.048900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,61.514100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,61.514100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,61.514100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,61.514100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,61.827600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<34.581300,0.000000,61.514100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.894900,0.000000,61.827600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,62.141100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<34.581300,0.000000,62.141100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,62.141100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,62.141100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,62.141100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,64.320600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,64.320600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,64.320600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,64.320600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,64.947600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<34.581300,0.000000,64.320600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,64.947600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,64.947600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,64.947600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,65.883100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,65.726400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,65.726400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,65.726400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,65.412800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,65.412800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,65.412800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,65.256100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,65.412800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,65.256100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,65.256100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,65.256100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,65.256100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,65.412800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,65.256100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,65.412800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,65.726400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,65.726400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,65.726400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,65.883100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,65.883100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,66.661900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,66.661900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,66.661900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,66.661900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,66.191600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<34.581300,0.000000,66.661900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,66.191600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,66.818600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<35.051600,0.000000,66.818600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,9.606100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,9.449400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.609800,0.000000,9.449400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,9.449400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,9.135800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.609800,0.000000,9.135800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,9.135800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,8.979100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.609800,0.000000,9.135800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,8.979100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,8.979100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.766600,0.000000,8.979100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,8.979100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,9.135800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.393700,0.000000,8.979100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,9.135800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,9.449400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.550400,0.000000,9.449400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,9.449400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,9.606100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.393700,0.000000,9.606100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.384900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.071300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.609800,0.000000,10.071300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.071300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,9.914600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.609800,0.000000,10.071300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,9.914600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,9.914600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.766600,0.000000,9.914600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,9.914600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,10.071300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.393700,0.000000,9.914600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,10.071300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,10.384900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.550400,0.000000,10.384900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,10.384900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,10.541600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.393700,0.000000,10.541600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,10.541600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,10.541600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.766600,0.000000,10.541600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,10.541600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.384900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.609800,0.000000,10.384900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,10.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.850100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.609800,0.000000,10.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,10.850100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.923400,0.000000,11.163600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<8.609800,0.000000,10.850100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.923400,0.000000,11.163600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,11.477100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<8.609800,0.000000,11.477100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,11.477100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,11.477100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.609800,0.000000,11.477100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,14.359600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,14.359600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.609800,0.000000,14.359600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,14.359600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,14.986600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<8.609800,0.000000,14.359600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.550400,0.000000,14.986600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.609800,0.000000,14.986600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.609800,0.000000,14.986600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,15.295100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,15.922100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,-44.992462,0> translate<8.766600,0.000000,15.295100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,15.295100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,15.922100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<8.766600,0.000000,15.922100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.080100,0.000000,15.295100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.080100,0.000000,15.922100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.080100,0.000000,15.922100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.393700,0.000000,15.608600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.766600,0.000000,15.608600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.766600,0.000000,15.608600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,19.088100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,19.558400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<4.101300,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,19.715100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<4.101300,0.000000,19.558400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,19.715100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<4.258100,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,19.558400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<4.571600,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,19.558400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,19.088100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.728400,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,20.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,20.180300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.101300,0.000000,20.180300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,20.180300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,20.023600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<4.101300,0.000000,20.180300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,20.023600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.885200,0.000000,20.023600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<4.258100,0.000000,20.023600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.885200,0.000000,20.023600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.180300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.885200,0.000000,20.023600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.180300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.493900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.041900,0.000000,20.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.493900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.885200,0.000000,20.650600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<4.885200,0.000000,20.650600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.885200,0.000000,20.650600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,20.650600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<4.258100,0.000000,20.650600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,20.650600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,20.493900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<4.101300,0.000000,20.493900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,20.959100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.959100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,20.959100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,20.959100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,21.272600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<4.728400,0.000000,21.272600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,21.272600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,21.586100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.728400,0.000000,21.272600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,21.586100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,21.586100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,21.586100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,22.521600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,21.894600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.101300,0.000000,21.894600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,21.894600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,21.894600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,21.894600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,21.894600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,22.521600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<5.041900,0.000000,22.521600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,21.894600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,22.208100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<4.571600,0.000000,22.208100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,22.830100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,22.830100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,22.830100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,22.830100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,23.300400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<4.101300,0.000000,23.300400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,23.457100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<4.101300,0.000000,23.300400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,23.457100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<4.258100,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,23.300400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<4.571600,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,22.830100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.728400,0.000000,22.830100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,23.143600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,23.457100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.728400,0.000000,23.143600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,19.401600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<3.771900,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,19.244800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,19.244800>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,19.244800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,19.401600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,19.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,19.711700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,19.711700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,19.711700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,19.711700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,20.338700>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<2.831300,0.000000,19.711700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,20.338700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,20.338700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,20.338700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,20.647200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,20.647200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,20.647200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,20.647200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,21.117500>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,21.117500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,21.117500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,21.274200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<2.831300,0.000000,21.117500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,21.274200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,21.274200>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,21.274200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,21.274200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,21.117500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<3.301600,0.000000,21.274200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,21.117500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,20.647200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.458400,0.000000,20.647200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,21.582700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,21.582700>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,21.582700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,21.582700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,21.739400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.615200,0.000000,21.582700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,21.739400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,22.053000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.771900,0.000000,22.053000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,22.053000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,22.209700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,22.209700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,22.209700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,22.209700>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,22.209700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,22.831700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,22.831700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,22.831700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,22.518200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,23.145200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,23.145200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,37.816600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<3.771900,0.000000,37.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,37.659800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,37.659800>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,37.659800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,37.816600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,37.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,38.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,38.126700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,38.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,38.126700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,38.753700>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<2.831300,0.000000,38.126700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,38.753700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,38.753700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,38.753700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,39.062200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,39.062200>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,39.062200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,39.062200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,39.532500>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,39.532500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,39.532500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,39.689200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<2.831300,0.000000,39.532500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,39.689200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,39.689200>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,39.689200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,39.689200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,39.532500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<3.301600,0.000000,39.689200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,39.532500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,39.062200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.458400,0.000000,39.062200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,39.997700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,39.997700>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,39.997700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,39.997700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,40.154400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.615200,0.000000,39.997700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,40.154400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,40.468000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.771900,0.000000,40.468000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,40.468000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,40.624700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,40.624700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,40.624700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,40.624700>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,40.624700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,41.246700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,41.246700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,41.246700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,40.933200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,41.560200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,41.560200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,37.503100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,37.973400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<4.101300,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,38.130100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<4.101300,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,38.130100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,38.130100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<4.258100,0.000000,38.130100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,38.130100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,37.973400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<4.571600,0.000000,38.130100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,37.503100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.728400,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.728400,0.000000,37.816600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,38.130100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.728400,0.000000,37.816600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,39.065600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,38.438600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.101300,0.000000,38.438600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,38.438600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,38.438600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,38.438600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,38.438600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,39.065600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<5.041900,0.000000,39.065600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,38.438600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,38.752100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<4.571600,0.000000,38.752100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,39.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,39.374100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,39.374100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,39.374100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,40.001100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<5.041900,0.000000,40.001100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,40.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.414900,0.000000,40.309600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<4.414900,0.000000,40.309600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.414900,0.000000,40.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,40.623100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<4.101300,0.000000,40.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,40.623100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.414900,0.000000,40.936600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<4.101300,0.000000,40.623100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.414900,0.000000,40.936600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,40.936600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<4.414900,0.000000,40.936600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,40.309600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,40.936600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<4.571600,0.000000,40.936600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,41.245100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,41.245100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,41.245100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,41.245100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,41.558600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.258100,0.000000,41.245100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,41.558600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,41.872100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<4.258100,0.000000,41.872100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.258100,0.000000,41.872100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.101300,0.000000,41.872100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<4.101300,0.000000,41.872100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.571600,0.000000,41.558600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.041900,0.000000,41.558600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<4.571600,0.000000,41.558600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,3.048400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,2.734800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.581300,0.000000,2.734800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,2.734800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,2.578100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<34.581300,0.000000,2.734800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,2.578100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,2.578100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,2.578100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,2.578100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,2.734800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,2.578100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,2.734800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.048400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,3.048400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.048400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,3.205100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,3.205100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,3.205100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,3.205100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,3.205100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,3.205100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,3.048400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,3.048400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,3.513600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,3.513600>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,3.513600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,3.513600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.670300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,3.513600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.670300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.983900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,3.983900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,3.983900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,4.140600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,4.140600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,4.140600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,4.140600>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,4.140600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,4.762600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,4.762600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,4.762600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,4.449100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,5.076100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<34.581300,0.000000,5.076100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,5.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,5.384600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,5.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,5.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,5.854900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<34.581300,0.000000,5.854900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,5.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,6.011600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.581300,0.000000,5.854900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.738100,0.000000,6.011600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,6.011600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<34.738100,0.000000,6.011600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.051600,0.000000,6.011600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,5.854900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<35.051600,0.000000,6.011600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,5.854900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.208400,0.000000,5.384600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.208400,0.000000,5.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,6.320100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,6.320100>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,6.320100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,6.320100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,6.476800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.365200,0.000000,6.320100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,6.476800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,6.790400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<35.521900,0.000000,6.790400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,6.790400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,6.947100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.365200,0.000000,6.947100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.365200,0.000000,6.947100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,6.947100>}
box{<0,0,-0.038100><0.783900,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,6.947100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.521900,0.000000,7.569100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,7.569100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<34.581300,0.000000,7.569100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,7.255600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.581300,0.000000,7.882600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<34.581300,0.000000,7.882600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,2.578100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,2.578100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.851300,0.000000,2.578100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,2.578100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.048400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<35.851300,0.000000,3.048400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.048400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,3.205100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<35.851300,0.000000,3.048400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,3.205100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,3.205100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.008100,0.000000,3.205100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,3.205100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,3.048400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<36.321600,0.000000,3.205100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,3.048400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,2.578100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.478400,0.000000,2.578100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.983900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.670300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.851300,0.000000,3.670300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.670300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,3.513600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<35.851300,0.000000,3.670300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,3.513600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.635200,0.000000,3.513600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<36.008100,0.000000,3.513600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.635200,0.000000,3.513600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,3.670300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.635200,0.000000,3.513600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,3.670300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,3.983900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<36.791900,0.000000,3.983900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,3.983900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.635200,0.000000,4.140600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<36.635200,0.000000,4.140600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.635200,0.000000,4.140600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,4.140600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<36.008100,0.000000,4.140600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,4.140600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,3.983900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<35.851300,0.000000,3.983900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,4.449100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,4.449100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.851300,0.000000,4.449100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,4.449100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,4.762600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<36.478400,0.000000,4.762600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,4.762600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,5.076100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.478400,0.000000,4.762600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,5.076100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,5.076100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.851300,0.000000,5.076100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,6.011600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,5.384600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.851300,0.000000,5.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,5.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,5.384600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.851300,0.000000,5.384600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,5.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,6.011600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<36.791900,0.000000,6.011600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,5.384600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,5.698100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<36.321600,0.000000,5.698100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,6.320100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,6.320100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.851300,0.000000,6.320100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,6.320100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,6.790400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<35.851300,0.000000,6.790400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.851300,0.000000,6.790400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,6.947100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<35.851300,0.000000,6.790400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.008100,0.000000,6.947100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,6.947100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.008100,0.000000,6.947100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.321600,0.000000,6.947100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,6.790400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<36.321600,0.000000,6.947100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,6.790400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,6.320100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.478400,0.000000,6.320100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.478400,0.000000,6.633600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.791900,0.000000,6.947100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<36.478400,0.000000,6.633600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,43.210100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.053400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,43.053400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.053400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,42.739800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,42.739800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,42.739800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,42.583100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.863800,0.000000,42.739800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,42.583100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,42.583100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,42.583100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,42.583100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,42.739800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.647700,0.000000,42.583100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,42.739800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.053400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,43.053400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.053400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,43.210100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.647700,0.000000,43.210100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.988900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.675300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,43.675300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.675300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,43.518600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.863800,0.000000,43.675300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,43.518600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,43.518600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,43.518600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,43.518600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.675300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.647700,0.000000,43.518600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.675300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.988900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,43.988900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,43.988900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,44.145600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.647700,0.000000,44.145600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,44.145600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,44.145600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,44.145600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,44.145600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,43.988900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,43.988900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,44.454100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,44.454100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,44.454100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,44.454100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,44.767600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<8.863800,0.000000,44.454100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,44.767600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.081100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<8.863800,0.000000,45.081100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.081100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,45.081100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,45.081100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,45.389600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.389600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,45.389600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.389600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.859900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,45.859900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,45.859900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,46.016600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,45.859900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,46.016600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,46.016600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,46.016600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,46.016600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,45.859900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<9.334100,0.000000,46.016600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,45.859900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,45.389600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.490900,0.000000,45.389600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,45.703100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,46.016600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.490900,0.000000,45.703100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,46.952100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,46.325100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,46.325100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,46.325100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,46.325100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,46.325100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,46.325100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,46.952100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,46.952100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,46.325100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,46.638600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,46.638600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,47.260600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,47.260600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,47.260600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,47.260600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,47.887600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,47.887600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,49.250600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,49.250600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,49.250600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,49.250600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,49.720900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,49.720900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,49.720900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,49.877600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,49.720900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,49.877600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,49.877600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,49.877600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,49.877600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,49.720900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<9.334100,0.000000,49.877600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,49.720900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,49.250600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.490900,0.000000,49.250600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,49.564100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,49.877600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.490900,0.000000,49.564100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,50.813100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,50.186100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,50.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,50.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,50.186100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,50.186100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,50.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,50.813100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,50.813100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,50.186100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,50.499600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,50.499600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,51.121600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,51.121600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,51.121600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,51.121600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,51.748600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,51.748600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,52.057100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,52.370600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<8.863800,0.000000,52.370600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,52.370600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,52.370600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,52.370600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,52.057100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,52.684100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,52.684100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,54.330600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,54.330600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,54.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,54.330600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,54.800900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,54.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,54.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,54.957600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,54.800900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,54.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,54.957600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,54.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,54.957600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,54.800900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<9.334100,0.000000,54.957600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,54.800900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,54.330600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.490900,0.000000,54.330600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,54.644100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,54.957600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.490900,0.000000,54.644100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,55.893100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,55.266100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,55.266100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,55.266100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,55.266100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,55.266100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,55.266100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,55.893100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,55.893100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,55.266100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,55.579600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,55.579600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,56.201600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,56.201600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,56.201600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,56.201600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,56.828600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,56.828600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,57.764100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,57.137100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.804400,0.000000,57.137100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,57.137100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,57.764100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<9.177400,0.000000,57.764100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,57.764100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,57.764100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,57.764100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,57.764100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,57.607400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,57.607400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,57.607400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,57.293800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,57.293800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,57.293800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,57.137100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.863800,0.000000,57.293800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,59.410600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,59.410600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,59.410600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,59.410600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,59.880900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,59.880900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,59.880900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,60.037600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,59.880900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,60.037600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,60.037600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,60.037600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,60.037600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,59.880900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<9.334100,0.000000,60.037600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,59.880900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,59.410600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.490900,0.000000,59.410600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,59.724100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,60.037600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.490900,0.000000,59.724100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,60.973100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,60.346100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,60.346100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,60.346100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,60.346100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,60.346100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,60.346100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,60.973100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,60.973100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,60.346100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,60.659600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,60.659600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,61.281600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,61.281600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,61.281600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,61.281600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,61.908600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,61.908600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,62.217100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,62.373800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.863800,0.000000,62.373800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,62.373800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,62.687400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,62.687400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,62.687400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,62.844100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,62.687400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,62.844100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,62.844100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,62.844100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.177400,0.000000,62.844100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,62.687400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.177400,0.000000,62.844100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,62.687400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,62.530600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.334100,0.000000,62.530600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,62.687400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,62.844100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<9.334100,0.000000,62.687400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,62.844100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,62.844100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<9.490900,0.000000,62.844100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,62.844100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,62.687400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<9.647700,0.000000,62.844100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,62.687400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,62.373800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.804400,0.000000,62.373800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,62.373800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.647700,0.000000,62.217100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.647700,0.000000,62.217100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,64.490600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,64.490600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,64.490600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,64.490600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,64.960900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.863800,0.000000,64.960900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,64.960900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,65.117600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.863800,0.000000,64.960900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.020600,0.000000,65.117600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,65.117600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<9.020600,0.000000,65.117600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,65.117600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,64.960900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<9.334100,0.000000,65.117600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,64.960900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,64.490600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.490900,0.000000,64.490600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.490900,0.000000,64.804100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,65.117600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<9.490900,0.000000,64.804100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,66.053100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,65.426100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.863800,0.000000,65.426100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,65.426100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,65.426100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,65.426100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,65.426100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,66.053100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,66.053100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,65.426100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,65.739600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,65.739600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,66.361600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,66.361600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,66.361600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,66.361600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,66.988600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.804400,0.000000,66.988600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.804400,0.000000,67.767400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,67.767400>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<8.863800,0.000000,67.767400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.863800,0.000000,67.767400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,67.297100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<8.863800,0.000000,67.767400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,67.297100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.334100,0.000000,67.924100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<9.334100,0.000000,67.924100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,24.803100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,24.803100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,24.803100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,24.803100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.144900,0.000000,25.116600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<2.831300,0.000000,24.803100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.144900,0.000000,25.116600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,25.430100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<2.831300,0.000000,25.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,25.430100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,25.430100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,25.430100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,25.738600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,25.738600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.831300,0.000000,25.738600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,25.738600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,26.208900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,26.208900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,26.208900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,26.365600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<2.831300,0.000000,26.208900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,26.365600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.144900,0.000000,26.365600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,26.365600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.144900,0.000000,26.365600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,26.208900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.144900,0.000000,26.365600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,26.208900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,26.365600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<3.301600,0.000000,26.208900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,26.365600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,26.365600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<3.458400,0.000000,26.365600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,26.365600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,26.208900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,26.365600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,26.208900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,25.738600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.771900,0.000000,25.738600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,25.738600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,26.208900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<3.301600,0.000000,26.208900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,26.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,26.674100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,26.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,26.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,26.830800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<2.831300,0.000000,26.830800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,26.830800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,27.144400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,27.144400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,27.144400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,27.301100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<2.831300,0.000000,27.144400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,27.301100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,27.301100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,27.301100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,27.301100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,27.144400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,27.301100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,27.144400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,26.830800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.771900,0.000000,26.830800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,26.830800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,26.674100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.615200,0.000000,26.674100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,26.674100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,27.301100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<2.988100,0.000000,27.301100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,27.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,27.609600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,27.609600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,27.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,27.766300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<2.831300,0.000000,27.766300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,27.766300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,28.079900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<2.831300,0.000000,28.079900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,28.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,28.236600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<2.831300,0.000000,28.079900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,28.236600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,28.236600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<2.988100,0.000000,28.236600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,28.236600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,28.079900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,28.236600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,28.079900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,27.766300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.771900,0.000000,27.766300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,27.766300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,27.609600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.615200,0.000000,27.609600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,27.609600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,28.236600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<2.988100,0.000000,28.236600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.831300,0.000000,29.172100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,28.858600>}
box{<0,0,-0.038100><0.350526,0.036000,0.038100> rotate<0,63.423453,0> translate<2.831300,0.000000,29.172100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.988100,0.000000,28.858600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,28.545100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<2.988100,0.000000,28.858600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,28.545100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,28.545100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<3.301600,0.000000,28.545100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,28.545100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,28.701800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.615200,0.000000,28.545100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,28.701800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,29.015400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<3.771900,0.000000,29.015400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.771900,0.000000,29.015400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,29.172100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.615200,0.000000,29.172100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.615200,0.000000,29.172100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,29.172100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<3.458400,0.000000,29.172100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.458400,0.000000,29.172100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,29.015400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<3.301600,0.000000,29.015400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,29.015400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.301600,0.000000,28.545100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.301600,0.000000,28.545100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,27.813400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<5.371300,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,27.499800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.371300,0.000000,27.499800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,27.499800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,27.343100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<5.371300,0.000000,27.499800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,27.343100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.528100,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,27.499800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,27.499800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,27.813400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.841600,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,27.970100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<5.841600,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,27.970100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.998400,0.000000,27.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,27.813400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.155200,0.000000,27.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,27.499800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.311900,0.000000,27.499800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,27.499800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,27.343100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.155200,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,28.435300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,28.435300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,28.435300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,28.592100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<6.311900,0.000000,28.592100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.214600,0.000000,28.435300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,28.435300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<5.214600,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,28.902200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,28.902200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,28.902200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,28.902200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.058900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,29.058900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.058900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,29.215700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<5.684900,0.000000,29.058900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,29.215700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,29.215700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,29.215700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,29.215700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.372500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<5.684900,0.000000,29.372500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.372500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,29.529200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,29.372500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,29.529200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,29.529200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,29.529200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.625400,0.000000,29.837700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.837700>}
box{<0,0,-0.038100><0.940500,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,29.837700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,29.837700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,30.308000>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,30.308000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,30.308000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,30.464700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,30.308000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,30.464700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,30.464700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,30.464700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,30.464700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,30.308000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.155200,0.000000,30.464700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,30.308000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,29.837700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.311900,0.000000,29.837700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,30.773200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,30.929900>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.371300,0.000000,30.929900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,30.929900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,30.929900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.371300,0.000000,30.929900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,30.773200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,31.086700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<6.311900,0.000000,31.086700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,31.867100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,31.553500>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.311900,0.000000,31.553500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,31.553500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,31.396800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.155200,0.000000,31.396800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,31.396800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,31.396800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,31.396800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,31.396800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,31.553500>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.684900,0.000000,31.553500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,31.553500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,31.867100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,31.867100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,31.867100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,32.023800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,31.867100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,32.023800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,32.023800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,32.023800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,32.023800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,31.396800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.998400,0.000000,31.396800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,32.332300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,32.959300>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,32.332300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,32.332300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,32.959300>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<5.684900,0.000000,32.959300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,33.267800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,33.894800>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,33.267800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,33.267800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,33.894800>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<5.684900,0.000000,33.894800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,34.203300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,34.360000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,34.360000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,34.360000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,34.360000>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,34.360000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,34.203300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,34.516800>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<6.311900,0.000000,34.516800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.214600,0.000000,34.360000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,34.360000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<5.214600,0.000000,34.360000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,34.983600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,35.297200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.311900,0.000000,35.297200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,35.297200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,35.453900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.155200,0.000000,35.453900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,35.453900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,35.453900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,35.453900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,35.453900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,35.297200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,35.297200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,35.297200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,34.983600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.684900,0.000000,34.983600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,34.983600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,34.826900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.684900,0.000000,34.983600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,34.826900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,34.826900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,34.826900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,34.826900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,34.983600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.155200,0.000000,34.826900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,35.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,35.762400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,35.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,35.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,36.232700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<5.684900,0.000000,36.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,36.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,36.389400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.684900,0.000000,36.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,36.389400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,36.389400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<5.841600,0.000000,36.389400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,27.343100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.641300,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,27.343100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.641300,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,27.970100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,27.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,27.656600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<7.111600,0.000000,27.656600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,28.435300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<6.641300,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,28.435300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,28.435300>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.641300,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,28.592100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,28.592100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,29.372500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,29.058900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.581900,0.000000,29.058900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,29.058900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,28.902200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.425200,0.000000,28.902200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,28.902200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,28.902200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,28.902200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,28.902200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.058900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,29.058900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.058900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.372500>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,29.372500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.372500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,29.529200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.954900,0.000000,29.372500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,29.529200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,29.529200>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,29.529200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,29.529200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,28.902200>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.268400,0.000000,28.902200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,30.464700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.994400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.954900,0.000000,29.994400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,29.994400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,29.837700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,29.994400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,29.837700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,29.837700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,29.837700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,29.837700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,29.994400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.425200,0.000000,29.837700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,29.994400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,30.464700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,30.464700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.798100,0.000000,30.929900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,30.929900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<6.798100,0.000000,30.929900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,30.929900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,31.086700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<7.425200,0.000000,30.929900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,30.773200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,31.086700>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,31.086700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,31.396800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,31.396800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954900,0.000000,31.396800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,31.396800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,31.710300>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,31.710300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,31.710300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,31.867100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,31.867100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,32.333000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,32.646600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,32.646600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,32.646600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,32.803300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<7.425200,0.000000,32.803300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,32.803300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,32.803300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,32.803300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,32.803300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,32.646600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.954900,0.000000,32.646600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,32.646600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,32.333000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.954900,0.000000,32.333000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,32.333000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,32.176300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,32.333000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,32.176300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,32.176300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,32.176300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,32.176300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,32.333000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.425200,0.000000,32.176300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,33.111800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,33.111800>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954900,0.000000,33.111800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,33.111800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,33.582100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,33.582100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,33.582100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,33.738800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.954900,0.000000,33.582100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,33.738800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,33.738800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,33.738800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,34.047300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,34.204000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,34.204000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,34.204000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,34.204000>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<6.954900,0.000000,34.204000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,34.047300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,34.360800>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,34.360800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.484600,0.000000,34.204000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.641300,0.000000,34.204000>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<6.484600,0.000000,34.204000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,35.297900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,34.827600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.954900,0.000000,34.827600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,34.827600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,34.670900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,34.827600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,34.670900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,34.670900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.111600,0.000000,34.670900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,34.670900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,34.827600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.425200,0.000000,34.670900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,34.827600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,35.297900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,35.297900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,35.606400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,36.076700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.581900,0.000000,36.076700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.581900,0.000000,36.076700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,36.233400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<7.425200,0.000000,36.233400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.425200,0.000000,36.233400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,36.076700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.268400,0.000000,36.076700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,36.076700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,35.763100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.268400,0.000000,35.763100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.268400,0.000000,35.763100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,35.606400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.111600,0.000000,35.606400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.111600,0.000000,35.606400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,35.763100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.954900,0.000000,35.763100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,35.763100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.954900,0.000000,36.233400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<6.954900,0.000000,36.233400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,27.343100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.851900,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.224900,0.000000,27.970100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<8.224900,0.000000,27.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.224900,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,27.970100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,27.970100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,27.970100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,27.813400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.911300,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,27.499800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.911300,0.000000,27.499800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,27.499800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,27.343100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.911300,0.000000,27.499800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,28.278600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,28.278600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,28.435300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.911300,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,28.435300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,28.748900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.911300,0.000000,28.748900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,28.748900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,28.905600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.911300,0.000000,28.748900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,28.905600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,28.905600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,28.905600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,28.905600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,28.748900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.695200,0.000000,28.905600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,28.748900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,28.435300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.851900,0.000000,28.435300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,28.435300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,28.278600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.695200,0.000000,28.278600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,28.278600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,28.905600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<8.068100,0.000000,28.905600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.224900,0.000000,29.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,29.527600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<7.911300,0.000000,29.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,29.527600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,29.527600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.911300,0.000000,29.527600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,29.214100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,29.841100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<8.851900,0.000000,29.841100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,30.149600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,30.149600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,30.149600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,30.149600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,30.306300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.911300,0.000000,30.306300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,30.306300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,30.619900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.911300,0.000000,30.619900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,30.619900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,30.776600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.911300,0.000000,30.619900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,30.776600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,30.776600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,30.776600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,30.776600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,30.619900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.695200,0.000000,30.776600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,30.619900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,30.306300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.851900,0.000000,30.306300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,30.306300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,30.149600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.695200,0.000000,30.149600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,30.149600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,30.776600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<8.068100,0.000000,30.776600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,31.085100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,31.712100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<8.381600,0.000000,31.712100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,32.020600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,32.020600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,32.020600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,32.020600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,32.177300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.911300,0.000000,32.177300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,32.177300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,32.490900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.911300,0.000000,32.490900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,32.490900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,32.647600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.911300,0.000000,32.490900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,32.647600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,32.647600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,32.647600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,32.647600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,32.490900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.695200,0.000000,32.647600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,32.490900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,32.177300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.851900,0.000000,32.177300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,32.177300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,32.020600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.695200,0.000000,32.020600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.695200,0.000000,32.020600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,32.647600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<8.068100,0.000000,32.647600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,33.426400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,33.426400>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.911300,0.000000,33.426400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,33.426400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,32.956100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<7.911300,0.000000,33.426400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,32.956100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,33.583100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<8.381600,0.000000,33.583100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,33.891600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,34.518600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<8.381600,0.000000,34.518600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,35.454100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,34.827100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.851900,0.000000,34.827100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,34.827100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.224900,0.000000,35.454100>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<8.224900,0.000000,35.454100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.224900,0.000000,35.454100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,35.454100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.068100,0.000000,35.454100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,35.454100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,35.297400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.911300,0.000000,35.297400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,35.297400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,34.983800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.911300,0.000000,34.983800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,34.983800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.068100,0.000000,34.827100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.911300,0.000000,34.983800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.851900,0.000000,36.232900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,36.232900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.911300,0.000000,36.232900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.911300,0.000000,36.232900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,35.762600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<7.911300,0.000000,36.232900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,35.762600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.381600,0.000000,36.389600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<8.381600,0.000000,36.389600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,19.088100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.371300,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,19.088100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,19.401600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<5.371300,0.000000,19.088100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,19.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,19.715100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<5.371300,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,19.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,19.715100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.371300,0.000000,19.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,20.023600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,20.023600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,20.023600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,20.023600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,20.337100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<5.371300,0.000000,20.337100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,20.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,20.650600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<5.371300,0.000000,20.337100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,20.650600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,20.650600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<5.684900,0.000000,20.650600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,20.023600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,20.650600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<5.841600,0.000000,20.650600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,20.959100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,21.586100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<5.371300,0.000000,20.959100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,21.586100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,20.959100>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<5.371300,0.000000,21.586100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,22.830100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,22.986800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<5.371300,0.000000,22.986800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,22.986800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,23.300400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.371300,0.000000,23.300400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,23.457100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<5.371300,0.000000,23.300400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,23.457100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.528100,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.684900,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,23.300400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<5.684900,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,23.143600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.841600,0.000000,23.143600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.841600,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,23.457100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<5.841600,0.000000,23.300400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,23.457100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<5.998400,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,23.457100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,23.300400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.155200,0.000000,23.457100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,23.300400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,22.986800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.311900,0.000000,22.986800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,22.986800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,22.830100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.155200,0.000000,22.830100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,23.765600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,23.765600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<5.528100,0.000000,23.765600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,23.765600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,23.922300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<5.371300,0.000000,23.922300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,23.922300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,24.235900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<5.371300,0.000000,24.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,24.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,24.392600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<5.371300,0.000000,24.235900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,24.392600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,24.392600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<5.528100,0.000000,24.392600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,24.392600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,24.235900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<6.155200,0.000000,24.392600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,24.235900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,23.922300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.311900,0.000000,23.922300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,23.922300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,23.765600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.155200,0.000000,23.765600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.155200,0.000000,23.765600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.528100,0.000000,24.392600>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<5.528100,0.000000,24.392600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,24.701100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,24.701100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<5.371300,0.000000,24.701100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,24.701100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,25.014600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<5.998400,0.000000,24.701100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.311900,0.000000,25.014600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,25.328100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<5.998400,0.000000,25.328100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.998400,0.000000,25.328100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.371300,0.000000,25.328100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<5.371300,0.000000,25.328100> }
//K1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,19.685000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,19.685000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.401000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,3.175000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,3.175000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,17.399000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,12.065000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,10.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<19.685000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,12.065000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,5.461000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,10.795000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,5.461000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,12.065000>}
box{<0,0,-0.076200><2.839806,0.036000,0.076200> rotate<0,-26.563298,0> translate<17.145000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,11.430000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.924000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,12.065000>}
box{<0,0,-0.127000><0.898026,0.036000,0.127000> rotate<0,-44.997030,0> translate<26.924000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,15.163800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,12.065000>}
box{<0,0,-0.076200><3.098800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,7.670800>}
box{<0,0,-0.076200><3.124200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,7.670800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.889200,0.000000,12.369800>}
box{<0,0,-0.127000><0.449372,0.036000,0.127000> rotate<0,-42.706571,0> translate<27.559000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,11.430000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.494000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,10.833100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,10.833100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,10.833100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,10.833100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,11.460100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<29.945800,0.000000,11.460100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,10.989800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,11.460100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.416100,0.000000,10.989800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.259400,0.000000,11.768600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,12.082100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<29.945800,0.000000,12.082100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,12.082100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,12.082100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,12.082100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,11.768600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,12.395600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.886400,0.000000,12.395600> }
//K2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,37.465000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,37.465000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.401000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,20.955000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,20.955000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,35.179000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,35.179000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,35.179000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,29.845000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<19.685000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,29.845000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,28.575000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,23.241000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,28.575000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,23.241000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,23.241000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,29.845000>}
box{<0,0,-0.076200><2.839806,0.036000,0.076200> rotate<0,-26.563298,0> translate<17.145000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,29.210000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.924000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,29.845000>}
box{<0,0,-0.127000><0.898026,0.036000,0.127000> rotate<0,-44.997030,0> translate<26.924000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,32.943800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,29.845000>}
box{<0,0,-0.076200><3.098800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,25.450800>}
box{<0,0,-0.076200><3.124200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,25.450800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.889200,0.000000,30.149800>}
box{<0,0,-0.127000><0.449372,0.036000,0.127000> rotate<0,-42.706571,0> translate<27.559000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,29.210000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.494000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,28.613100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,28.613100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,28.613100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,28.613100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,29.240100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<29.945800,0.000000,29.240100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,28.769800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,29.240100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.416100,0.000000,28.769800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,30.175600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,29.548600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.886400,0.000000,29.548600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,29.548600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.259400,0.000000,30.175600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<30.259400,0.000000,30.175600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.259400,0.000000,30.175600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,30.175600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.102600,0.000000,30.175600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,30.175600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,30.018900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<29.945800,0.000000,30.018900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,30.018900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,29.705300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.945800,0.000000,29.705300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,29.705300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,29.548600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<29.945800,0.000000,29.705300> }
//K3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,55.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,55.245000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,55.245000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.401000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,38.735000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,55.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,38.735000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,52.959000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,52.959000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,52.959000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,47.625000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,47.625000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,46.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,47.625000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<19.685000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,47.625000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,46.355000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,41.021000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,46.355000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,41.021000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,41.021000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,47.625000>}
box{<0,0,-0.076200><2.839806,0.036000,0.076200> rotate<0,-26.563298,0> translate<17.145000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,46.990000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.924000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,47.625000>}
box{<0,0,-0.127000><0.898026,0.036000,0.127000> rotate<0,-44.997030,0> translate<26.924000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,50.723800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,47.625000>}
box{<0,0,-0.076200><3.098800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,43.230800>}
box{<0,0,-0.076200><3.124200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,43.230800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.889200,0.000000,47.929800>}
box{<0,0,-0.127000><0.449372,0.036000,0.127000> rotate<0,-42.706571,0> translate<27.559000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,46.990000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.494000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,46.393100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,46.393100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,46.393100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,47.020100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<29.945800,0.000000,47.020100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,46.549800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,47.020100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.416100,0.000000,46.549800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,47.328600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,47.485300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<29.945800,0.000000,47.485300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,47.485300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,47.798900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<29.945800,0.000000,47.798900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,47.798900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,47.955600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<29.945800,0.000000,47.798900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.102600,0.000000,47.955600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.259400,0.000000,47.955600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.102600,0.000000,47.955600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.259400,0.000000,47.955600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,47.798900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.259400,0.000000,47.955600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,47.798900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,47.642100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.416100,0.000000,47.642100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,47.798900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,47.955600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<30.416100,0.000000,47.798900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,47.955600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.729700,0.000000,47.955600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<30.572900,0.000000,47.955600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.729700,0.000000,47.955600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,47.798900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.729700,0.000000,47.955600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,47.798900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,47.485300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.886400,0.000000,47.485300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,47.485300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.729700,0.000000,47.328600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.729700,0.000000,47.328600> }
//K4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,73.025000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,73.025000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,73.025000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,73.025000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.401000,0.000000,73.025000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,56.515000>}
box{<0,0,-0.076200><22.606000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,73.025000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,56.515000>}
box{<0,0,-0.076200><16.510000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.795000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,70.739000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,70.739000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,70.739000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,70.739000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,65.405000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,65.405000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,64.135000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.145000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,65.405000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<19.685000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,65.405000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.145000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,64.135000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<17.145000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,58.801000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.415000,0.000000,58.801000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.415000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.685000,0.000000,64.135000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.415000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,58.801000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,58.801000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,58.801000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,65.405000>}
box{<0,0,-0.076200><2.839806,0.036000,0.076200> rotate<0,-26.563298,0> translate<17.145000,0.000000,64.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.924000,0.000000,64.770000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<26.924000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,65.405000>}
box{<0,0,-0.127000><0.898026,0.036000,0.127000> rotate<0,-44.997030,0> translate<26.924000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,68.503800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,65.405000>}
box{<0,0,-0.076200><3.098800,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,64.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.559000,0.000000,61.010800>}
box{<0,0,-0.076200><3.124200,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.559000,0.000000,61.010800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.559000,0.000000,65.405000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.889200,0.000000,65.709800>}
box{<0,0,-0.127000><0.449372,0.036000,0.127000> rotate<0,-42.706571,0> translate<27.559000,0.000000,65.405000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.494000,0.000000,64.770000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.510000,0.000000,64.770000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.494000,0.000000,64.770000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,64.173100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,64.173100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,64.173100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.572900,0.000000,64.173100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,64.800100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<29.945800,0.000000,64.800100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,64.329800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,64.800100>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.416100,0.000000,64.329800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.886400,0.000000,65.578900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,65.578900>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.945800,0.000000,65.578900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.945800,0.000000,65.578900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,65.108600>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<29.945800,0.000000,65.578900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,65.108600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.416100,0.000000,65.735600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<30.416100,0.000000,65.735600> }
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,7.721600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.758400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,7.721600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.758400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.758400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,22.758400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.196000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,7.213600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<37.465000,0.000000,7.213600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,7.721600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,7.213600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,7.213600>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,7.213600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,7.213600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,7.721600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<38.481000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,7.721600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.758400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.481000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.758400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.758400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.758400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<42.799000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,7.721600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,7.721600>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,7.721600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.758400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,22.758400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,22.758400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,16.637000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,16.637000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,16.256000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,8.839200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,11.252200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,11.252200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,9.220200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,11.633200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,11.633200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,16.256000>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,9.220200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,11.252200>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,11.252200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,14.224000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,16.637000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,8.839200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,9.220200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,8.839200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,11.252200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,11.633200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,11.252200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,21.259800>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,21.259800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,21.640800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,21.640800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,18.846800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,21.259800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,21.259800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,18.846800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,19.227800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,18.846800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,21.259800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,21.640800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,21.259800> }
difference{
cylinder{<37.592000,0,15.240000><37.592000,0.036000,15.240000>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,15.240000><37.592000,0.135000,15.240000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,10.236200><37.592000,0.036000,10.236200>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,10.236200><37.592000,0.135000,10.236200>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,15.240000><40.640000,0.036000,15.240000>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,15.240000><40.640000,0.135000,15.240000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,10.236200><40.640000,0.036000,10.236200>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,10.236200><40.640000,0.135000,10.236200>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,20.243800><40.640000,0.036000,20.243800>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,20.243800><40.640000,0.135000,20.243800>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,20.243800><37.592000,0.036000,20.243800>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,20.243800><37.592000,0.135000,20.243800>0.431800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,12.725400>}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,17.754600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,11.176000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,11.803000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<37.121300,0.000000,11.176000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,11.803000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,11.176000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<37.121300,0.000000,11.803000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.434900,0.000000,12.111500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,12.425000>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<37.121300,0.000000,12.425000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,12.425000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,12.425000>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.121300,0.000000,12.425000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,12.111500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,12.738500>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<38.061900,0.000000,12.738500> }
//X2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.961600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,37.998400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.961600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,37.998400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,37.998400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,37.998400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.196000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,22.453600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<37.465000,0.000000,22.453600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,22.961600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,22.453600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,22.453600>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,22.453600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,22.453600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.961600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<38.481000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,22.961600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,37.998400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.481000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,37.998400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,37.998400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,37.998400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<42.799000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,22.961600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,22.961600>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,22.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,37.998400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,37.998400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,37.998400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,31.877000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,31.496000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,24.079200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,26.492200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,26.492200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,24.460200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,26.873200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,26.873200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,29.464000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,31.496000>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,24.460200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,26.492200>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,26.492200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,29.464000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,31.877000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,24.079200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,24.460200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,24.079200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,26.492200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,26.873200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,26.492200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,34.467800>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,36.499800>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,36.499800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,34.467800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,36.880800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,36.880800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,34.086800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,36.499800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,36.499800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,34.086800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,34.467800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,34.086800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,36.499800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,36.880800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,36.499800> }
difference{
cylinder{<37.592000,0,30.480000><37.592000,0.036000,30.480000>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,30.480000><37.592000,0.135000,30.480000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,25.476200><37.592000,0.036000,25.476200>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,25.476200><37.592000,0.135000,25.476200>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,30.480000><40.640000,0.036000,30.480000>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,30.480000><40.640000,0.135000,30.480000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,25.476200><40.640000,0.036000,25.476200>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,25.476200><40.640000,0.135000,25.476200>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,35.483800><40.640000,0.036000,35.483800>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,35.483800><40.640000,0.135000,35.483800>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,35.483800><37.592000,0.036000,35.483800>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,35.483800><37.592000,0.135000,35.483800>0.431800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,27.965400>}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,32.994600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,27.043000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<37.121300,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,27.043000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,26.416000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<37.121300,0.000000,27.043000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,27.978500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,27.351500>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.061900,0.000000,27.351500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,27.351500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.434900,0.000000,27.978500>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,44.997030,0> translate<37.434900,0.000000,27.978500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.434900,0.000000,27.978500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,27.978500>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<37.278100,0.000000,27.978500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,27.978500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,27.821800>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<37.121300,0.000000,27.821800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,27.821800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,27.508200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.121300,0.000000,27.508200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,27.508200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,27.351500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<37.121300,0.000000,27.508200> }
//X3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,38.201600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,53.238400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,38.201600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,53.238400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.238400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,53.238400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.196000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,37.693600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<37.465000,0.000000,37.693600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,38.201600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,37.693600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,37.693600>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,37.693600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,37.693600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,38.201600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<38.481000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,38.201600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.238400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.481000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.238400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.238400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.238400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<42.799000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,38.201600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,38.201600>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,38.201600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.238400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,53.238400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,53.238400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,47.117000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,47.117000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,46.736000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,39.319200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,41.732200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,41.732200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,39.700200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,42.113200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,42.113200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,46.736000>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,39.700200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,41.732200>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,41.732200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,44.704000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,46.736000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,47.117000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,46.736000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,39.319200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,39.700200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,39.319200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,41.732200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,42.113200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,41.732200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,49.707800>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,51.739800>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,51.739800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,49.707800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,52.120800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,52.120800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,51.739800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,51.739800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,49.326800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,49.707800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,49.326800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,51.739800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,52.120800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,51.739800> }
difference{
cylinder{<37.592000,0,45.720000><37.592000,0.036000,45.720000>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,45.720000><37.592000,0.135000,45.720000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,40.716200><37.592000,0.036000,40.716200>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,40.716200><37.592000,0.135000,40.716200>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,45.720000><40.640000,0.036000,45.720000>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,45.720000><40.640000,0.135000,45.720000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,40.716200><40.640000,0.036000,40.716200>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,40.716200><40.640000,0.135000,40.716200>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,50.723800><40.640000,0.036000,50.723800>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,50.723800><40.640000,0.135000,50.723800>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,50.723800><37.592000,0.036000,50.723800>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,50.723800><37.592000,0.135000,50.723800>0.431800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,43.205400>}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,48.234600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,42.283000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<37.121300,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,42.283000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,41.656000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<37.121300,0.000000,42.283000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,42.591500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,42.748200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<37.121300,0.000000,42.748200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,42.748200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,43.061800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.121300,0.000000,43.061800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,43.061800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,43.218500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<37.121300,0.000000,43.061800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.278100,0.000000,43.218500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.434900,0.000000,43.218500>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<37.278100,0.000000,43.218500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.434900,0.000000,43.218500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,43.061800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.434900,0.000000,43.218500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,43.061800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,42.905000>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.591600,0.000000,42.905000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,43.061800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.748400,0.000000,43.218500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<37.591600,0.000000,43.061800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.748400,0.000000,43.218500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.905200,0.000000,43.218500>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<37.748400,0.000000,43.218500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.905200,0.000000,43.218500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,43.061800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.905200,0.000000,43.218500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,43.061800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,42.748200>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.061900,0.000000,42.748200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,42.748200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.905200,0.000000,42.591500>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.905200,0.000000,42.591500> }
//X4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.441600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,68.478400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,53.441600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.703000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,68.478400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,68.478400>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,68.478400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<44.196000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,52.933600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<37.465000,0.000000,52.933600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.703000,0.000000,53.441600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.703000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,52.933600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,52.933600>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,52.933600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,52.933600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.441600>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<38.481000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.592000,0.000000,53.441600>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.592000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,68.478400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.481000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,68.478400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,68.478400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,68.478400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<42.799000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,53.441600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,53.441600>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,53.441600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.799000,0.000000,68.478400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.196000,0.000000,68.478400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.799000,0.000000,68.478400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,62.357000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,62.357000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,61.976000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,54.559200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,56.972200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,56.972200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,54.940200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,57.353200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,57.353200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,59.944000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,61.976000>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,54.940200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,56.972200>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,56.972200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,59.563000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,59.944000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,59.563000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,61.976000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,62.357000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,61.976000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,54.559200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,54.940200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,54.559200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,56.972200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,57.353200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,56.972200> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<41.656000,0.000000,64.947800>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<39.624000,0.000000,66.979800>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<39.624000,0.000000,66.979800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,64.947800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,67.360800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.624000,0.000000,67.360800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,64.566800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,66.979800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<39.243000,0.000000,66.979800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.656000,0.000000,64.566800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.037000,0.000000,64.947800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.656000,0.000000,64.566800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.243000,0.000000,66.979800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.624000,0.000000,67.360800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.243000,0.000000,66.979800> }
difference{
cylinder{<37.592000,0,60.960000><37.592000,0.036000,60.960000>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,60.960000><37.592000,0.135000,60.960000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,55.956200><37.592000,0.036000,55.956200>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,55.956200><37.592000,0.135000,55.956200>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,60.960000><40.640000,0.036000,60.960000>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,60.960000><40.640000,0.135000,60.960000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,55.956200><40.640000,0.036000,55.956200>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,55.956200><40.640000,0.135000,55.956200>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<40.640000,0,65.963800><40.640000,0.036000,65.963800>1.854200 translate<0,0.000000,0>}
cylinder{<40.640000,-0.1,65.963800><40.640000,0.135000,65.963800>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<37.592000,0,65.963800><37.592000,0.036000,65.963800>0.584200 translate<0,0.000000,0>}
cylinder{<37.592000,-0.1,65.963800><37.592000,0.135000,65.963800>0.431800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,58.445400>}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-90.000000,0> translate<40.640000,0.000000,63.474600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,56.896000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,57.523000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<37.121300,0.000000,56.896000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,57.523000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,56.896000>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<37.121300,0.000000,57.523000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.061900,0.000000,58.301800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,58.301800>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.121300,0.000000,58.301800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.121300,0.000000,58.301800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,57.831500>}
box{<0,0,-0.038100><0.665105,0.036000,0.038100> rotate<0,44.997030,0> translate<37.121300,0.000000,58.301800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,57.831500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.591600,0.000000,58.458500>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<37.591600,0.000000,58.458500> }
//X5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,17.780000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,17.780000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.747000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,7.620000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,7.620000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.254000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,18.288000>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<6.858000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,17.780000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.858000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,18.288000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.842000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,18.288000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,17.780000>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<5.842000,0.000000,18.288000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,17.780000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,7.620000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.969000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,7.620000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,7.620000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.651000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,17.780000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,7.620000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,11.201400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,8.788400>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,11.201400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,11.582400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,9.169400>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,11.582400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,16.611600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,14.198600>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,16.611600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,16.230600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,13.817600>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,16.230600> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,11.201400>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,9.169400>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,11.201400> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,16.230600>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,14.198600>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,16.230600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,11.582400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,11.201400>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,11.201400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,9.169400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,8.788400>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,8.788400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,16.611600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,16.230600>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,16.230600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,14.198600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,13.817600>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,13.817600> }
difference{
cylinder{<6.858000,0,10.185400><6.858000,0.036000,10.185400>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,10.185400><6.858000,0.135000,10.185400>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<6.858000,0,15.214600><6.858000,0.036000,15.214600>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,15.214600><6.858000,0.135000,15.214600>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,10.185400><3.810000,0.036000,10.185400>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,10.185400><3.810000,0.135000,10.185400>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,15.214600><3.810000,0.036000,15.214600>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,15.214600><3.810000,0.135000,15.214600>1.701800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-270.000000,0> translate<3.810000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,12.454600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,13.081600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<6.387300,0.000000,12.454600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,13.081600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,12.454600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<6.387300,0.000000,13.081600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,14.017100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,13.390100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.387300,0.000000,13.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,13.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,13.390100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<6.387300,0.000000,13.390100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,13.390100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.700900,0.000000,13.703600>}
box{<0,0,-0.038100><0.350481,0.036000,0.038100> rotate<0,63.438073,0> translate<6.700900,0.000000,13.703600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.700900,0.000000,13.703600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.700900,0.000000,13.860400>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,90.000000,0> translate<6.700900,0.000000,13.860400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.700900,0.000000,13.860400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,14.017100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<6.700900,0.000000,13.860400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,14.017100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,14.017100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.857600,0.000000,14.017100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,14.017100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,13.860400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<7.171200,0.000000,14.017100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,13.860400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,13.546800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.327900,0.000000,13.546800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,13.546800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,13.390100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.171200,0.000000,13.390100> }
//X6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.318400>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,43.281600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,58.318400>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,90.000000,0> translate<7.747000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,43.281600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,43.281600>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,43.281600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.254000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,58.826400>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<6.858000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,58.318400>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.858000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,58.826400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,58.826400>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.842000,0.000000,58.826400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,58.826400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.318400>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<5.842000,0.000000,58.826400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,58.318400>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,43.281600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.969000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,43.281600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,43.281600>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,43.281600>}
box{<0,0,-0.076200><15.036800,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.651000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.318400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.318400>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,58.318400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,43.281600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,43.281600>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,43.281600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,49.403000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,52.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,49.784000>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,52.197000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,57.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,54.787800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,57.200800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,56.819800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,54.406800>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,56.819800> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,51.816000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,49.784000>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,56.819800>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,54.787800>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,56.819800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,52.197000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,51.816000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,51.816000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,49.784000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,49.403000>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,49.403000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,57.200800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,56.819800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,56.819800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,54.787800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,54.406800>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,54.406800> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,46.812200>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,44.780200>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,46.812200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,46.812200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,44.399200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,46.812200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,47.193200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,44.780200>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,47.193200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,47.193200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,46.812200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,46.812200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,44.780200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,44.399200>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,44.399200> }
difference{
cylinder{<6.858000,0,50.800000><6.858000,0.036000,50.800000>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,50.800000><6.858000,0.135000,50.800000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<6.858000,0,55.803800><6.858000,0.036000,55.803800>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,55.803800><6.858000,0.135000,55.803800>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,50.800000><3.810000,0.036000,50.800000>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,50.800000><3.810000,0.135000,50.800000>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,55.803800><3.810000,0.036000,55.803800>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,55.803800><3.810000,0.135000,55.803800>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,45.796200><3.810000,0.036000,45.796200>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,45.796200><3.810000,0.135000,45.796200>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<6.858000,0,45.796200><6.858000,0.036000,45.796200>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,45.796200><6.858000,0.135000,45.796200>0.431800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-270.000000,0> translate<3.810000,0.000000,53.314600>}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-270.000000,0> translate<3.810000,0.000000,48.285400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,47.989200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,48.616200>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<6.387300,0.000000,47.989200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,48.616200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,47.989200>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<6.387300,0.000000,48.616200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,49.551700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.544100,0.000000,49.238200>}
box{<0,0,-0.038100><0.350526,0.036000,0.038100> rotate<0,63.423453,0> translate<6.387300,0.000000,49.551700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.544100,0.000000,49.238200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,48.924700>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<6.544100,0.000000,49.238200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,48.924700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,48.924700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<6.857600,0.000000,48.924700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,48.924700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,49.081400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<7.171200,0.000000,48.924700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,49.081400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,49.395000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<7.327900,0.000000,49.395000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,49.395000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,49.551700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<7.171200,0.000000,49.551700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,49.551700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.014400,0.000000,49.551700>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<7.014400,0.000000,49.551700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.014400,0.000000,49.551700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,49.395000>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<6.857600,0.000000,49.395000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,49.395000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.857600,0.000000,48.924700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<6.857600,0.000000,48.924700> }
//X7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,68.580000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,68.580000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.747000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.420000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,58.420000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<0.254000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,69.088000>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,-75.958743,0> translate<6.858000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,68.580000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.858000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,69.088000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,69.088000>}
box{<0,0,-0.076200><1.143000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.842000,0.000000,69.088000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.842000,0.000000,69.088000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,68.580000>}
box{<0,0,-0.076200><0.523634,0.036000,0.076200> rotate<0,75.958743,0> translate<5.842000,0.000000,69.088000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.858000,0.000000,68.580000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.969000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.420000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.969000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.420000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.420000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.651000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.969000,0.000000,68.580000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.651000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.651000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.254000,0.000000,58.420000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<0.254000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,62.001400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,59.588400>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,62.001400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,62.382400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,59.969400>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,62.382400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,67.411600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,64.998600>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.794000,0.000000,67.411600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,67.030600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,64.617600>}
box{<0,0,-0.076200><3.412497,0.036000,0.076200> rotate<0,44.997030,0> translate<2.413000,0.000000,67.030600> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,62.001400>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,59.969400>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,62.001400> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<2.794000,0.000000,67.030600>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<4.826000,0.000000,64.998600>}
box{<0,0,-0.304800><2.873682,0.036000,0.304800> rotate<0,44.997030,0> translate<2.794000,0.000000,67.030600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,62.382400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,62.001400>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,62.001400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,59.969400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,59.588400>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,59.588400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.794000,0.000000,67.411600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.413000,0.000000,67.030600>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.413000,0.000000,67.030600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,64.998600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.826000,0.000000,64.617600>}
box{<0,0,-0.076200><0.538815,0.036000,0.076200> rotate<0,-44.997030,0> translate<4.826000,0.000000,64.617600> }
difference{
cylinder{<6.858000,0,60.985400><6.858000,0.036000,60.985400>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,60.985400><6.858000,0.135000,60.985400>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<6.858000,0,66.014600><6.858000,0.036000,66.014600>0.584200 translate<0,0.000000,0>}
cylinder{<6.858000,-0.1,66.014600><6.858000,0.135000,66.014600>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,60.985400><3.810000,0.036000,60.985400>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,60.985400><3.810000,0.135000,60.985400>1.701800 translate<0,0.000000,0>}}
difference{
cylinder{<3.810000,0,66.014600><3.810000,0.036000,66.014600>1.854200 translate<0,0.000000,0>}
cylinder{<3.810000,-0.1,66.014600><3.810000,0.135000,66.014600>1.701800 translate<0,0.000000,0>}}
box{<-0.381000,0,-1.905000><0.381000,0.036000,1.905000> rotate<0,-270.000000,0> translate<3.810000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,63.254600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,63.881600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,-33.685033,0> translate<6.387300,0.000000,63.254600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,63.881600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,63.254600>}
box{<0,0,-0.038100><1.130424,0.036000,0.038100> rotate<0,33.685033,0> translate<6.387300,0.000000,63.881600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,64.190100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,64.817100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<6.387300,0.000000,64.817100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.387300,0.000000,64.817100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.544100,0.000000,64.817100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<6.387300,0.000000,64.817100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<6.544100,0.000000,64.817100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,64.190100>}
box{<0,0,-0.038100><0.886783,0.036000,0.038100> rotate<0,44.992462,0> translate<6.544100,0.000000,64.817100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.171200,0.000000,64.190100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.327900,0.000000,64.190100>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<7.171200,0.000000,64.190100> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MB006_A(-22.225000,0,-38.100000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:

/* BandMate Project, bar_holder.scad
 * bar_holder.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

/* This is for holding down a flat metal bar. Two are needed */

$fn = 64;

bar_width = 30; // Flat bar width. 
bar_height = 3; // Flat bar height. 
bar_inset = 5;  // Flat bar inset. 

screw_hole = 4; // Screw hole diameter. 

x_height = bar_height + 0.2; // Height of block. 
x_length = 15;  // Length of block. 
x_width = bar_width+5;

rotate([180,0,0]) // Flip for printing wihtout support. 
difference()
{
  translate([x_length/2,0,x_height/2]) cube([x_length,bar_width+5,x_height],center=true);
  union()
  {
    translate([bar_inset/2,0,bar_height/2]) cube([bar_inset,bar_width,bar_height],center=true);
    translate([(x_length-bar_inset)/2+bar_inset,x_width/3,0]) cylinder(r=screw_hole/2,h=40);
    translate([(x_length-bar_inset)/2+bar_inset,-x_width/3,0]) cylinder(r=screw_hole/2,h=40);
  }
}

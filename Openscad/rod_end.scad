/* BandMate Project, rod_end.scad
 * rod_end.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

difference()
{
  translate([0,0,0]) cube([45,55,10],center=true);
  
  union()
  {
    hole_rods();
    hole_wood();
    hole_bar_string();
    hole_bearing();
    hole_screws();
  }
}

/* Holes for rods. */
module hole_rods()
{
  translate([15,20,0]) rotate([0,0,0]) cylinder(h=50,r=4.25);
  translate([15,-20,0]) rotate([0,0,0]) cylinder(h=50,r=4.25);
}

module hole_wood()
{
  translate([-45/2,0,0]) cube([45,45,100],center=true);
}

/* Holes for flat bar and string*/
module hole_bar_string()
{
  translate([3,0,-50]) cylinder(r=10,h=100); // Hole for string.
  translate([3/2,0,50]) cube([3,25.4,100],center=true); // Hole for flat bar. 
}

module hole_bearing()
{
  rotate([0,90,0]) cylinder(r=1.6,h=100);
  translate([5,0,0]) rotate([0,90,0]) cylinder(r=3,h=10);
  translate([16+20/2,0,0]) cube([20,28,20],center=true);
}

module hole_screws()
{
  translate([-15,0,0]) rotate([90,0,0]) cylinder(r=2,h=100,center=true);
  translate([-5,0,0]) rotate([90,0,0]) cylinder(r=2,h=100,center=true);
}

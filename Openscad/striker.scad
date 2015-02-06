/* BandMate Project, striker.scad
 * striker.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <other_parts.scad>


%translate([-7.5,0,-20]) rotate([0,90,0]) solenoid();

difference()
{
	translate([0,10,-35/2]) cube([15,3,35],center=true);
	union()
	{
	hull()
	{
		translate([4,0,-5]) rotate([90,0,0]) cylinder(r=1.5,h=50,center=true); 
		translate([4,0,-15]) rotate([90,0,0]) cylinder(r=1.5,h=50,center=true); 
	}
	hull()
	{
		translate([-4,0,-30]) rotate([90,0,0]) cylinder(r=1.5,h=50,center=true); 
		translate([-4,0,-20]) rotate([90,0,0]) cylinder(r=1.5,h=50,center=true); 
	}
	}
}

translate([0,0,-2]) bottom_plate(); // Bottom plate. 

/* Bottom plate. */
module bottom_plate()
{
  difference()
  {
/*    linear_extrude(height=2)
    hull()
    {
      translate([-30/2,0,0]) circle(r=2+2);
      circle(r=10); 
      translate([30/2,0,0]) circle(r=2+2);
    }*/
	cylinder(r=20,h=2);
		
    union() // Screw holes. 
    {
      translate([-30/2,0,0]) cylinder(r=2,h=10,center=true);
      translate([30/2,0,0]) cylinder(r=2,h=10,center=true);
      translate([0,0,0]) cylinder(r=4,h=10,center=true);  // Center hole. 

    }
  }
}

/* BandMate Project, bearing_holder.scad
 * bearing_holder.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <other_parts.scad>;

translate([0,0,13]) bearing_holder();
%translate([0,0,0]) bearing(hole_radius=5, radius=15,width=9);



module bearing_holder()
{

//translate([-21,9,0]) belt_clamp();


difference()
{
//intersection()
//{
union()
{
 xyprofile();
	translate([0,5,4.5]) rotate([90,0,0]) cylinder(r=4.5,h=2,center=true);
	translate([0,-5,4.5]) rotate([90,0,0]) cylinder(r=4.5,h=3,center=true);
	translate([0,5.5,4.5]) rotate([90,0,0]) cylinder(r=6,h=2,center=true);
	translate([0,-5.5,4.5]) rotate([90,0,0]) cylinder(r=6,h=2,center=true);

}
//translate([0,0,-35]) rotate([90,0,0]) cylinder(r=50,h=100,center=true);
//}

union()
{
	translate([0,0,-5]) cube([30,30,10],center=true);
	translate([0,0,5+9]) cube([30,30,10],center=true);

	// Holes for screws. 
	translate([-20,0,1]) cylinder(r=4,h=30);
	translate([20,0,1]) cylinder(r=4,h=30);	
	//translate([0,0,6]) rotate([90,0,0]) cylinder(r=8.5,h=16,center=true);
}

}

//translate([0,0,-10]) %bearing();

module xyprofile()
{
	linear_extrude(height=9)
	difference()
	{
	hull()
	{
		translate([20,0,0]) circle(r=6.5);
		translate([-20,0,0]) circle(r=6.5);
	}
	union()
	{
	translate([-20,0,0]) circle(r=2);
	translate([20,0,0]) circle(r=2);
	square([32,11],center=true);

	/*hull()
	{
	translate([-13,0,0]) circle(r=5.5);
	translate([13,0,0]) circle(r=5.5);
	}*/

	}
	}

}
}


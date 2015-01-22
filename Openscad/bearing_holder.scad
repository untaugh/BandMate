/* BandMate Project, bearing_holder.scad
 * bearing_holder.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <other_parts.scad>;

translate([0,0,0]) bearing_holder(r1=4,r2=11+1,w=7,d=36);
%translate([0,0,4]) bearing(hole_radius=4, radius=11,width=7);

/*
 r1 = bearing hole radius
 r2 = bearing outer radius
 w = bearing width
 d = distance between screw holes 
*/
module bearing_holder(r1=5, r2=15, w=9, d=40)
{

//translate([-21,9,0]) belt_clamp();


difference()
{
union()
{
 xyprofile();
	translate([0,w/2+0.5,r1]) rotate([90,0,0]) cylinder(r=r1,h=3,center=true);
	translate([0,-(w/2+0.5),r1]) rotate([90,0,0]) cylinder(r=r1,h=3,center=true);

	translate([0,w/2+1,r1]) rotate([90,0,0]) cylinder(r=r1+2,h=2,center=true);
	translate([0,-(w/2+1),r1]) rotate([90,0,0]) cylinder(r=r1+2,h=2,center=true);

}
//translate([0,0,-35]) rotate([90,0,0]) cylinder(r=50,h=100,center=true);
//}

union()
{
	translate([0,0,-5]) cube([30,30,10],center=true);
	translate([0,0,5+r1*2]) cube([30,30,10],center=true);

	// Holes for screws. 
	translate([-d/2,0,1]) cylinder(r=3.8,h=30);
	translate([d/2,0,1]) cylinder(r=3.8,h=30);	
	//translate([0,0,6]) rotate([90,0,0]) cylinder(r=8.5,h=16,center=true);
}

}

//translate([0,0,-10]) %bearing();

module xyprofile()
{
	linear_extrude(height=r1*2)
	difference()
	{
	hull()
	{
		translate([d/2,0,0]) circle(r=w/2+2);
		translate([-d/2,0,0]) circle(r=w/2+2);
	}
	union()
	{
	translate([-d/2,0,0]) circle(r=2);
	translate([d/2,0,0]) circle(r=2);
	square([r2*2+2,w+2],center=true);

	/*hull()
	{
	translate([-13,0,0]) circle(r=5.5);
	translate([13,0,0]) circle(r=5.5);
	}*/

	}
	}

}
}


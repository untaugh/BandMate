/* BandMate Project, bearing_holder.scad
 * bearing_holder.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <other_parts.scad>;

translate([0,0,17]) bearing_holder();
//%bearing();



module bearing_holder()
{

translate([-21,9,0]) belt_clamp();


difference()
{
intersection()
{
 xyprofile();

translate([0,0,-35]) rotate([90,0,0]) cylinder(r=50,h=100,center=true);
}

union()
{
	// Holes for screws. 
	translate([-30,0,1]) cylinder(r=4,h=30);
	translate([30,0,1]) cylinder(r=4,h=30);	
	translate([0,0,6]) rotate([90,0,0]) cylinder(r=8.5,h=16,center=true);
}

}

//translate([0,0,-10]) %bearing();

module xyprofile()
{
	linear_extrude(height=50)
	difference()
	{
	hull()
	{
		translate([30,0,0]) circle(r=6);
		translate([20,0,0]) circle(r=9);
		translate([-20,0,0]) circle(r=9);
		translate([-30,0,0]) circle(r=6);
	}
	union()
	{
	translate([-30,0,0]) circle(r=2);
	translate([30,0,0]) circle(r=2);
	hull()
	{
	translate([-18,0,0]) circle(r=7);
	translate([18,0,0]) circle(r=7);
	}

	}
	}

}
}

module belt_clamp()
{
    clamp_height = 6;
    clamp_teeth = 8;
    
    for (i = [0:clamp_teeth]) {
	translate([i*5,0,0]) rotate([0,0,0]) cube([2,1,clamp_height]);
    }

    //translate([0,-2,0])
    //cube([(clamp_teeth+1)*5-3,2,clamp_height]);

    translate([0,2.5,0])
    cube([(clamp_teeth+1)*5-3,1,clamp_height]);

	cube([(clamp_teeth+1)*5-3,3,1]);

/*
    translate([(clamp_teeth)*2.5/2,4,clamp_height/2])
    cube([(clamp_teeth+2)*2.5,3,clamp_height],true);

    *translate([(clamp_teeth)*2.5/2,1.5,1])
    cube([(clamp_teeth+2)*2.5,8,2],true);
*/
}

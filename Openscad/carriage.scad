/* BandMate Project, carriage.scad
 * carriage.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <hexnut.scad>
use <other_parts.scad>
use <bearing_holder.scad>

translate([-25,0,15]) %belt(radius=8,length=200);

translate([0,0,15]) %rods();

translate([0,0,5]) rotate([0,0,0]) carriage();

//%translate([0,0,0]) bearing();
//%translate([0,0,0]) bearing(hole_radius=5, radius=15,width=9);


%translate([0,0,13]) bearing_holder();

// Linear bearing test
%translate([0,20,15]) rotate([0,90,0]) cylinder(h=24.5,r=7.75, center=true);



module carriage()
{

translate([-12.5,7.5,7]) belt_clamp();

difference()
{
// Side blocks.
union()
{
translate([0,16,6]) cube([30,11,12],center=true);
translate([0,-16,6]) cube([30,11,12],center=true);

// Middle plate.
//translate([0,0,6]) cube([60,22,4],center=true);


// Bottom plate.
translate([0,0,0])
linear_extrude(height=7)
hull()
{
translate([14,0,0]) circle(r=11);
translate([-14,0,0]) circle(r=11);
}
}
union()
{
// Holes for bearings.
translate([0,20,0]) bearing_hollow();
translate([0,-20,0]) bearing_hollow();

// Holes for screw. 
/*translate([30,6,0]) cylinder(r=2.2,h=30);
translate([30,-6,0]) cylinder(r=2.2,h=30);
translate([-30,6,0]) cylinder(r=2.2,h=30);
translate([-30,-6,0]) cylinder(r=2.2,h=30);
*/

// Holes for screw. 
translate([-20,0,0]) cylinder(r=2.2,h=30);
translate([20,0,0]) cylinder(r=2.2,h=30);
translate([-20,0,0]) hexnut(width=7.5, height=6);
translate([20,0,0]) hexnut(width=7.5, height=6);


// Middle hole. 
//rotate([0,90,0]) rotate([0,0,45]) cube([12,12,200],center=true);
rotate([0,90,0]) cylinder(r=4,h=100,center=true);

// Bearing axle hole
//translate([0,0,18]) rotate([90,0,0]) cylinder(r=10,h=26,center=true);



// Hole for middle bearing. 
	linear_extrude(h=40)
	square([32,11],center=true);
	/*hull()
	{
	translate([-10,0,0]) circle(r=8);
	translate([10,0,0]) circle(r=8);
	}*/

}
}
}

module bearing_hollow()
{
	translate([0,0,10]) rotate([0,90,0]) cylinder(h=24.5,r=7.75, center=true);
	hull()
	{
		translate([0,0,10]) rotate([0,90,0]) cylinder(h=100,r=5, center=true);
		translate([0,0,20]) rotate([0,90,0]) cylinder(h=100,r=5, center=true);
	}
}



module belt_clamp()
{
    clamp_height = 6;
    clamp_teeth = 10;
    
    for (i = [0:clamp_teeth]) {
	translate([i*2.5,0,0]) rotate([0,0,45]) cube([1.5,1.5,clamp_height]);
    }

    //translate([0,-2,0])
    //cube([(clamp_teeth+1)*5-3,2,clamp_height]);

    translate([-1,-0.5,0])
    cube([(clamp_teeth+1)*2.5-2.5+2,1.5,clamp_height]);

	//cube([(clamp_teeth+1)*2.5-3,3,1]);

/*
    translate([(clamp_teeth)*2.5/2,4,clamp_height/2])
    cube([(clamp_teeth+2)*2.5,3,clamp_height],true);

    *translate([(clamp_teeth)*2.5/2,1.5,1])
    cube([(clamp_teeth+2)*2.5,8,2],true);
*/
}


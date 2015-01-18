/* BandMate Project, carriage.scad
 * carriage.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

use <hexnut.scad>
use <other_parts.scad>
use <bearing_holder.scad>

translate([-25,0,20]) %belt(radius=11,length=200);

translate([0,0,15]) %rods();

translate([0,0,5]) rotate([0,0,0]) carriage();

%translate([0,0,0]) bearing();


//translate([0,0,17]) bearing_holder();

// Linear bearing test
%translate([0,20,15]) rotate([0,90,0]) cylinder(h=24.5,r=7.75, center=true);



module carriage()
{

difference()
{
// Side blocks.
union()
{
translate([0,20,6]) cube([30,18,12],center=true);
translate([0,-20,6]) cube([30,18,12],center=true);



// Bottom plate.
translate([0,0,0])
linear_extrude(height=12)
hull()
{
translate([25,0,0]) circle(r=11);
translate([-25,0,0]) circle(r=11);

//translate([30,5,0]) circle(r=6);
//translate([-30,5,0]) circle(r=6);
//translate([30,-5,0]) circle(r=6);
//translate([-30,-5,0]) circle(r=6);
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
translate([-30,0,0]) cylinder(r=2.2,h=30);
translate([30,0,0]) cylinder(r=2.2,h=30);
translate([-30,0,0]) hexnut(width=7.5, height=11);
translate([30,0,0]) hexnut(width=7.5, height=11);


// Middle hole. 
rotate([0,90,0]) rotate([0,0,45]) cube([12,12,200],center=true);

// Bearing axle hole
translate([0,0,18]) rotate([90,0,0]) cylinder(r=10,h=26,center=true);



// Hole for middle bearing. 
	linear_extrude(h=40)
	hull()
	{
	translate([-18,0,0]) circle(r=7);
	translate([18,0,0]) circle(r=7);
	}

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



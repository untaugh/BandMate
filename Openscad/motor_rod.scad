/* BandMate Project, motor_rod.scad
 * motor_rod.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */

$fn = 64;

motor_rod();

module motor()
{
	translate([30,0,-33/2]) cube([42,42,33],center=true);
}

module motor_rod()
{

%motor();

difference()
{

    union() {
	translate([25,0,0])
	base_plate();
	rod_holder();
    }

    union() {
	translate([0,0,0])
	rod_holes();
    }
}

module rod_holder()
{
    rh_height=22;

    translate([0,-20,rh_height/2])
    cube([10,16,rh_height],true);

    translate([0,20,rh_height/2])
    cube([10,16,rh_height],true);
}

module rod_holes()
{
	translate([-25,20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
	translate([-25,-20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);

}

module base_plate()
{
    base_height = 3;
    mounting_hole = 5;
    
    difference() {
	
	/* Base plate. */
	union() {
	    linear_extrude(base_height)
	    minkowski() {
		union() {
		    square([50,40],true);
		    translate([-30,25-5-2,0]) square([30,4],true);
		    translate([-30,-25+5+2,0]) square([30,4],true);
		}
		circle(r=5);
	    }
	   

	    /* Motor screw distance. */
	    translate([5,0,0]) 
	    for (i=[0:3]) {
		rotate([0,0,i*90])
		translate([15.5,15.5,0])
		cylinder(r=5,h=7);
	    }
	    
	}

	/* Holes for base plate. */
	union() {
	    translate([-40,18,-5]) cylinder(r=mounting_hole/2,h=30);
	    translate([-40,-18,-5]) cylinder(r=mounting_hole/2,h=30);
	    translate([5,0,0]) motor_holes();
	}
    }

    /* Support material. */

    translate([-10,-25+1.5,0]) 
    hull() {
	translate([0,0,1.5]) cube([70,3,3],true);
	translate([-15,0,5]) cube([3,3,10],true);
    }
    
    translate([-10,25-1.5,0]) 
    hull() {
	translate([0,0,1.5]) cube([70,3,3],true);
	translate([-15,0,5]) cube([3,3,10],true);
    }
}

module motor_holes()
{
    screw_hole = 3.5;
    center_hole = 30;
    screw_dist = 15.5;

    /* Holes for screws. */
    for (i=[0:3]) {
	rotate([0,0,i*90])
	translate([screw_dist,screw_dist,-15])
	cylinder(r=screw_hole/2,h=30);
    }
    
    /* Center Hole */
    translate([0,0,-15])
    cylinder(r=center_hole/2,h=30);
}
}
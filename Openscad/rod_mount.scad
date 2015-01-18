/* BandMate Project, rod_mount.scad
 * rod_mount.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */


$fn = 64;

use <other_parts.scad>

//translate([0,0,20]) belt(11,100);

//translate([0,0,24]) cylinder(r=15,h=1.5);

//translate([0,0,11]) hexnut(width=10,height=5);

//%translate([-20,0,0]) bar();

rod_mount2();

%translate([0,0,7]) rotate([0,90,0]) cylinder(r=2,h=100,center=true);
%translate([0,0,21]) cylinder(r=11,h=8,center=true);


module rod_mount2()
{
	difference()
	{
		union()
		{
		/* Bearing washer. */
		translate([0,0,16]) rotate([0,0,0]) cylinder(r=8,h=2,center=true);
		translate([0,0,19]) rotate([0,0,0]) cylinder(r=3.8,h=10,center=true);
		}
		union()
		{
			cylinder(r=1.7,h=100);
			translate([0,0,13]) cylinder(r=3,h=3);
		}
	}
	difference()
	{
		union()
		{
			intersection()
			{
				translate([0,0,55/2]) cube([55,54,55],center=true);
				rotate([90,0,0]) cylinder(r=42/2,h=100,center=true);
	
			}
		}
		union()
		{
			/* Middle cut out. */
			translate([0,0,50/2+16]) cube([100,28,50],center=true);
			/* Hole for string. */
			translate([0,0,4]) rotate([0,90,0]) cylinder(r=10,h=100,center=true);
			/* Holes for rods. */
			translate([-25,20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
			translate([-25,-20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
			/* Hole for flat bar. */
			translate([25,0,1.5]) cube([30,30,3],center=true);
			/* Middle bearing hole */
			cylinder(r=1.7,h=100);
			/* Screw holes. */
			translate([14,18,-2]) cylinder(r=2.5,h=30);
			translate([14,-18,-2]) cylinder(r=2.5,h=30);
			translate([-14,18,-2]) cylinder(r=2.5,h=30);
			translate([-14,-18,-2]) cylinder(r=2.5,h=30);
			/* Screw sink holes. */
			translate([14,18,2]) cylinder(r=4.25,h=30);
			translate([14,-18,2]) cylinder(r=4.25,h=30);
			translate([-14,18,2]) cylinder(r=4.25,h=30);
			translate([-14,-18,2]) cylinder(r=4.25,h=30);
			/* Hex nut.*/
			translate([0,0,13]) cylinder(r=3,h=3);
		}
	}
}

module rod_mount()
{
difference()
{

union()
{
	translate([0,0,19]) rotate([0,0,0]) cylinder(r=3.8,h=10,center=true);
	translate([0,0,16]) rotate([0,0,0]) cylinder(r=8,h=2,center=true);
}
	cylinder(r=1.7,h=100);

}

difference()
{

    union() {
	translate([0,0,0])
	base_plate();
	//rod_holder();
    }

    union() {
	translate([0,0,0])

	rod_holes();
	cylinder(r=1.7,h=100);
	
	// String hole. 
	//translate([0,0,0]) rotate([0,90,0]) cylinder(r=13,h=18,center=true);
    }
}

/* Ball bearing + washers */
%translate([0,0,21]) cylinder(r=11,h=8,center=true);
//%translate([0,0,20]) cylinder(r=8,h=10,center=true);

module rod_holder()
{
    rh_height=22;

    translate([0,0,rh_height/2]) cube([16,56,rh_height],true);
}

module rod_holes()
{
    /* Holes for rods. */
    translate([-25,20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
    translate([-25,-20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);

    /* Holes for bearing. */
    //cylinder(r=4.25,h=100,center=true);
    translate([0,0,21]) cube([20,22+6,10],true);
    //translate([0,0,9]) cube([20,14,12],true); 
}

module base_plate()
{
    base_height = 3;
    mounting_hole = 5;
    
    difference()
	{
		difference() 
		{
			translate([0,0,1.5]) cube([55,55,3],center=true);
			translate([25,0,1.5]) cube([30,30,4],center=true);	
		}
	
		/* Base plate. */
		/*union() {
	    linear_extrude(base_height)
	    minkowski() {
		union() {
		    square([4,40],true);
		    translate([0,28-5-3,0]) square([50,6],true);
		    translate([0,-28+5+3,0]) square([50,6],true);
		}
		circle(r=5);
	    }
	    
		}*/

		/* Holes for base plate. */
		union() 
		{
		translate([20,17,-5]) cylinder(r=mounting_hole/2,h=30);
	   translate([20,-17,-5]) cylinder(r=mounting_hole/2,h=30);
	   translate([-20,17,-5]) cylinder(r=mounting_hole/2,h=30);
	   translate([-20,-17,-5]) cylinder(r=mounting_hole/2,h=30);
		}
	}

    /* Support sides. */
    translate([0,-28+1.5,0]) 
    hull() {
	translate([0,0,1.5]) cube([50,3,3],true);
	translate([0,0,7]) cube([3,3,14],true);
    }
    
    translate([0,28-1.5,0]) 
    hull() {
	translate([0,0,1.5]) cube([50,3,3],true);
	translate([0,0,7]) cube([3,3,14],true);
    }

}
}

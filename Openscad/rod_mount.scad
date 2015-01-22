/* BandMate Project, rod_mount.scad
 * rod_mount.scad by Oskari Rundgren is licensed under the
 * Creative Commons Attribution-ShareAlike 4.0 International License.
 */


$fn = 64;

use <other_parts.scad>

use <bearing_holder.scad>


//translate([0,0,20]) belt(11,100);

//translate([0,0,24]) cylinder(r=15,h=1.5);

//translate([0,0,11]) hexnut(width=10,height=5);

//%translate([-20,0,0]) bar();

//translate([-18,0,20]) rotate([90,0,90]) translate([0,0,0]) bearing_holder(r1=4,r2=11+1,w=7,d=36);


rod_mount();

%translate([0,0,7]) rotate([0,90,0]) cylinder(r=2,h=100,center=true);

module rod_mount()
{


	difference()
	{
		union()
		{
			/* The left right standing parts. */
			translate([0,20,0]) stand();
			translate([0,-20,0]) rotate([0,0,180]) stand();
			/* Bottom plate.*/
			bottom_plate(); 
			/* Stands for screws. */
			//translate([-24,18,0]) stand2();
			//translate([-24,-18,0]) rotate([0,0,180]) stand2();


		}
		union()
		{
	 		/* Holes for rods. */
    		translate([-3,20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
    		translate([-3,-20,15]) rotate([0,90,0]) cylinder(h=50,r=4.25);
	 		/* Holes for bearing holder. */
    		translate([-50+10,18,20]) rotate([0,90,0]) cylinder(h=50,r=1.5);
    		translate([-40,-18,20]) rotate([0,90,0]) cylinder(h=50,r=1.5);

			/* Middle hole. */
			//translate([0,0,0]) rotate([0,90,0]) cylinder(r=10,h=100,center=true);
			/* Middle cut. */
			translate([50+10,0,5]) cube([100,25.4,10],center=true);
			translate([14,17,-2]) cylinder(r=2,h=30);
			translate([14,-17,-2]) cylinder(r=2,h=30);
			translate([-14,17,-2]) cylinder(r=2,h=30);
			translate([-14,-17,-2]) cylinder(r=2,h=30);

		}
	}

}
module bottom_plate()
{
	height = 3;
	radius=6;
	hull()
	{
		translate([14,23-radius,0]) cylinder(r=radius,h=height);
		translate([14,-(23-radius),0]) cylinder(r=radius,h=height);
		translate([-14,23-radius,0]) cylinder(r=radius,h=height);
		translate([-14,-(23-radius),0]) cylinder(r=radius,h=height);
	}
}

module stand()
{
	hull()
	{
		translate([0,0,15]) rotate([0,90,0]) cylinder(r=8,h=14,center=true);
		translate([0,-3,3/2]) cube([14,12,3],center=true);
	}
}

module stand2()
{
	hull()
	{
		translate([0,0,20]) rotate([0,90,0]) cylinder(r=6,h=10,center=true);
		translate([0,-1,3/2]) cube([15,12,3],center=true);
	}
}


module rod_mount2()
{

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

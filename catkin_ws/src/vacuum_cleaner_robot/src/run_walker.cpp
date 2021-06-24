#include "Walker.h"

int main(int argc, char **argv) {
    // Initiate new ROS node named "walker"
    ros::init(argc, argv, "walker");

    // Create new stopper object
    Walker walker;

    // Start the movement
    walker.startMoving();

    return 0;
}

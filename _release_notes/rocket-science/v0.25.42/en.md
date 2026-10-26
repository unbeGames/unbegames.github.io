---
game: rocket-science
version: "0.25.42"
type: patch
release_date: 2026-10-26
lang: en
title: 'v0.25.42 Release Notes'
permalink: /en/games/rocket-science/releases/v0.25.42/
---
### Features:

- added a persistent flight history with pagination, end-of-mission records, and entries for removed spacecraft;
- added spacecraft decommissioning and splashed-state tracking;
- added reversible assembly animations and animation previews;
- added physics interpolation between animation states;
- save files can now be moved freely between save slot folders;
- custom saves now load directly into flight;
- added dynamic time zone changes during flight below 20 km and use of UTC above;
- added flight journal entries for docking and undocking, atmosphere entry and exit, orbital milestones, part and fairing jettison, parachute events, primary-body changes, propellant depletion, and splashdowns;
- added launch-from-anywhere support for surface mods;
- TAA is now improved and enabled by default during the flight instead of SMAA (less flickering).

### New content:

- added the first iteration of cloth-simulated parachute visuals;
- improved grammar and localization across tutorials and quests;
- added drogue chutes and configured pilot chutes.

### Changes:

- improved the accuracy and stability of elliptic-orbit calculations, especially for highly eccentric and near-parabolic orbits;
- prevented precision loss in hyperbolic trajectories near their asymptotes;
- corrected open-orbit timing so hyperbolic and parabolic trajectories are no longer treated as periodic;
- corrected parabolic calculations for large negative mean anomalies;
- corrected hyperbolic targeting tangents and invalid intersection handling;
- corrected targeting subdivision angle wrapping and sphere-of-influence limits for combined orbit sections;
- reworked thermal radiation to use solvers and improved atmospheric conduction;
- reworked the flight simulation command, spacecraft group, joint storage, and part-state systems;
- improved flight journal presentation and pagination;
- improved UI sprite clarity;
- optimized cable simulation and proximity calculations.

### Part changes:

- improved mirror symmetry, snapping, and offset behavior;
- improved wheel and landing-gear placement and rotation;
- reworked joint offsets to use baked configurations and IDs;
- improved parachute deployment, loading, decoupling, attachment, and cloth baking;
- improved reversible part animations and staging integration.

### Fixes:

- disappearing sphere-of-influence exits when editing maneuvers while reducing speed;
- incorrect atmosphere-exit altitude data and occasionally broken initial orbit updates;
- parabolic true-anomaly and mean-anomaly conversions receiving eccentricity instead of the actual anomaly;
- parabolic orbits being misclassified near escape velocity because of floating-point rounding;
- incorrect orientation when reconstructing inclined near-circular orbits from position and velocity;
- inaccurate elliptic and hyperbolic anomaly calculations near zero mean anomaly, especially close to parabolic eccentricities;
- incorrect midpoint and half-size calculations for orbit sections crossing the zero-angle boundary;
- incorrect wrapped-section sample offsets and elliptic sample-index overflow at 2π;
- flight journal interaction, loading, record-related, and pagination problems;
- missing tutorial part-name localization;
- atmospheric conduction being applied twice alongside convection;
- natural and forced atmospheric convection using radius instead of diameter and the wrong average-distance input;
- internal heat production and contents heat transfer using total part mass without excluding skin mass;
- heat transfer between skins, part interiors, connected parts, and contents not accounting correctly for both sides' thermal capacities;
- heat-shield ablation rates changing with the simulation time step;
- reentry radiative heating being ten times too high because of an incorrect W/cm²-to-W/m² conversion factor;
- burn-time and maneuver data not updating after staging or throttle changes;
- angular momentum transfer after decoupling and spacecraft undocking;
- spacecraft entering different physics worlds;
- stale connections after part or spacecraft destruction;
- transforms and rotations after decoupling;
- multiple parachute deployment, save-loading, attachment, and recursion errors;
- cable simulation stopping while time was paused;
- the operation of Skycrane 0;
- assembly animation skipping and preview problems;
- repeated undo/redo failures involving staging, offset, and rotation operations;
- broken mirror symmetry and symmetric-part offset behavior;
- wheel twisting, mirrored-part offsets, and wheel-system calculations;
- the recovery button being unavailable in water;
- the journal button appearing in rocket assembly mode;
- a distorted navball when DLSS rendering scale was below 100%;
- blurry UI sprites and several missing UI localizations.

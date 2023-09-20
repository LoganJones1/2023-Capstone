
"use strict";

let GetNodesInRadius = require('./GetNodesInRadius.js')
let PublishMap = require('./PublishMap.js')
let AddLink = require('./AddLink.js')
let ListLabels = require('./ListLabels.js')
let GetMap = require('./GetMap.js')
let ResetPose = require('./ResetPose.js')
let GlobalBundleAdjustment = require('./GlobalBundleAdjustment.js')
let LoadDatabase = require('./LoadDatabase.js')
let GetMap2 = require('./GetMap2.js')
let CleanupLocalGrids = require('./CleanupLocalGrids.js')
let DetectMoreLoopClosures = require('./DetectMoreLoopClosures.js')
let GetNodeData = require('./GetNodeData.js')
let SetLabel = require('./SetLabel.js')
let SetGoal = require('./SetGoal.js')
let GetPlan = require('./GetPlan.js')
let RemoveLabel = require('./RemoveLabel.js')

module.exports = {
  GetNodesInRadius: GetNodesInRadius,
  PublishMap: PublishMap,
  AddLink: AddLink,
  ListLabels: ListLabels,
  GetMap: GetMap,
  ResetPose: ResetPose,
  GlobalBundleAdjustment: GlobalBundleAdjustment,
  LoadDatabase: LoadDatabase,
  GetMap2: GetMap2,
  CleanupLocalGrids: CleanupLocalGrids,
  DetectMoreLoopClosures: DetectMoreLoopClosures,
  GetNodeData: GetNodeData,
  SetLabel: SetLabel,
  SetGoal: SetGoal,
  GetPlan: GetPlan,
  RemoveLabel: RemoveLabel,
};

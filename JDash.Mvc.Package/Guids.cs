// Guids.cs
// MUST match guids.h
using System;

namespace Kalitte.JDash_Package
{
    static class GuidList
    {
        public const string guidJDash_PackagePkgString = "eec2d036-1b0b-41dd-8827-30b5f797bfb1";
        public const string guidJDash_PackageCmdSetString = "47973ac8-3302-4819-af2f-d4ed5644e198";

        public static readonly Guid guidJDash_PackageCmdSet = new Guid(guidJDash_PackageCmdSetString);
    };
}
import { createStackNavigator } from "react-navigation-stack";

import MapsHome from "./screens/MapsHome";
import Home from "./screens/";


export const MapsNavigator = createStackNavigator(
  {
    Maps: { screen: MapsHome },
    Home: { screen: Home },

  },
  {
    initialRouteName: "Home",
  }
);

/** 
  All of the routes for the Material Dashboard 2 React are added here,
  You can add a new route, customize the routes and delete the routes here.

  Once you add a new route on this file it will be visible automatically on
  the Sidenav.

  For adding a new route you can follow the existing routes in the routes array.
  1. The `type` key with the `collapse` value is used for a route.
  2. The `type` key with the `title` value is used for a title inside the Sidenav. 
  3. The `type` key with the `divider` value is used for a divider between Sidenav items.
  4. The `name` key is used for the name of the route on the Sidenav.
  5. The `key` key is used for the key of the route (It will help you with the key prop inside a loop).
  6. The `icon` key is used for the icon of the route on the Sidenav, you have to add a node.
  7. The `collapse` key is used for making a collapsible item on the Sidenav that has other routes
  inside (nested routes), you need to pass the nested routes inside an array as a value for the `collapse` key.
  8. The `route` key is used to store the route location which is used for the react router.
  9. The `href` key is used to store the external links location.
  10. The `title` key is only for the item with the type of `title` and its used for the title text on the Sidenav.
  10. The `component` key is used to store the component of its route.
*/

// Material Dashboard 2 React layouts
import Dashboard from "pages/dashboard";

// @mui icons
import Icon from "@mui/material/Icon";
import Blank2 from "pages/blank2";
import People from "pages/people";
import Traffic from "pages/traffic";
import Weather from "pages/weather";
import Transport from "pages/transport";
import Corona from "pages/corona";
import News from "pages/news";

const routes = [
  {
    type: "collapse",
    name: "People",
    key: "people",
    icon: <Icon fontSize="small">people</Icon>,
    route: "react-team3/people",
    component: <People />,
  },
  {
    type: "collapse",
    name: "Traffic",
    key: "traffic",
    icon: <Icon fontSize="small">directions</Icon>,
    route: "react-team3/traffic",
    component: <Traffic />,
  },
  {
    type: "collapse",
    name: "Weather",
    key: "weather",
    icon: <Icon fontSize="small">thermostat</Icon>,
    route: "react-team3/weather",
    component: <Weather />,
  },
  {
    type: "collapse",
    name: "Transport",
    key: "transport",
    icon: <Icon fontSize="small">train</Icon>,
    route: "react-team3/transport",
    component: <Transport />,
  },
  {
    type: "collapse",
    name: "News",
    key: "news",
    icon: <Icon fontSize="small">article</Icon>,
    route: "react-team3/news",
    component: <News />,
  },
];

export default routes;

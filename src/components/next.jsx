import React from "react";
import { Link } from "gatsby"
export default ({next, title}) => (
  <div style={{display:"flex", justifyContent:"space-between",flexDirection:"row"}}>
    <div></div>
    <Link to={next}>Next — {title}</Link>
  </div>
);

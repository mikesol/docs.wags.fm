import React from "react";
import { Link } from "gatsby"
export default ({ prev, prevT, next, nextT }) => (
	<div
		style={{
			display: "flex",
			justifyContent: "space-between",
			flexDirection: "row",
		}}
	>
		{prev ? <Link to={prev}>Back — {prevT}</Link> : <div></div>}
		<div>
			<Link to={'../'}>Home</Link>
		</div>
		{next ? <Link to={next}>Next — {nextT}</Link> : <div></div>}
	</div>
);

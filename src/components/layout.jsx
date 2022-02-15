import React from "react";
import { transitions, positions, Provider as AlertProvider } from "react-alert";
import AlertTemplate from "react-alert-template-basic";
import { Helmet } from "react-helmet";
import { loaderUrl } from "../../output/Config";
import { makeLoader } from "../../output/JIT.Loader";

const options = {
  position: positions.BOTTOM_CENTER,
  timeout: 5000,
  offset: "30px",
  transition: transitions.SCALE,
};

export const PSContext = React.createContext();

export default function Layout({ children }) {
  return (
		<div className='application'>
			<Helmet>
				<meta charSet='utf-8' />
				<title>Wags Documentation</title>
				<link rel='canonical' href='http://mikesol.github.io/fp-sound' />
				<script
					async
					src='https://www.googletagmanager.com/gtag/js?id=G-GZRNEZ67E8'
				></script>
				<script>
					{`window.dataLayer = window.dataLayer || []
          function gtag(){window.dataLayer.push(arguments)}
          gtag('js', new Date());
          gtag('config', 'G-GZRNEZ67E8');`}
				</script>
			</Helmet>
			<AlertProvider template={AlertTemplate} {...options}>
				<PSContext.Provider value={makeLoader(loaderUrl)}>
					{children}
				</PSContext.Provider>
			</AlertProvider>
		</div>
	);
}

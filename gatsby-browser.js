import "./src/styles/global.css"

const React = require("react")
const Layout = require("./src/components/layout").default

export const wrapPageElement = ({ element, props }) => {
  return <Layout {...props}>{element}</Layout>
}
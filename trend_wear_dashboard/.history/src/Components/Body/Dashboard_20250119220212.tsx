import "./Dashboard.css";

interface Props {
  children: React.ReactNode;
}

const Dashboard = ({ children }: Props) => {
  return <div id="content-body">{children}</div>;
};

export default Dashboard;

import "./Dashboard.css";

interface Props {
  title: string;
}

const Dashboard = ({ title }: Props) => {
  return <div id="content-body">{title}</div>;
};

export default Dashboard;

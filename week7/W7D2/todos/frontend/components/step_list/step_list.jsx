import React from 'react';
// Components
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

// const StepList = ({ steps, todo_id, receiveStep }) => {
//   const stepItems = steps.map(step => (
//     <StepListItemContainer
//       key={step.id}
//       step={step} />
//   ));
//
//   return (
//     <div>
//       <ul className="step-list">
//         { stepItems }
//       </ul>
//       <StepForm todo_id={ todo_id } receiveStep={ receiveStep } />
//     </div>
//   );
// };

class StepList extends React.Component {
  componentWillReceiveProps(props){
    console.log(props);
  }
  render() {
    console.log("rendering");
    const stepItems = this.props.steps.map(step => (
      <StepListItemContainer
        key={step.id}
        step={step} />
    ));

    const todoId = this.props.todo_id;

    return (
      <div>
        <ul className="step-list">
          { stepItems }
        </ul>
        <StepForm todo_id={ todoId } receiveStep={ this.props.receiveStep.bind(this) } />
      </div>
    );
  }
}

export default StepList;
